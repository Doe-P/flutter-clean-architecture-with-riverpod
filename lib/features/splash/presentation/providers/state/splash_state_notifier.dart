import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_store_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:product_store_app/features/splash/presentation/providers/state/splash_state.dart';

import '../../../../../services/credential/domain/repositories/credential_repository.dart';
import '../../../../../services/user/domain/repositories/user_repository.dart';

class SplashStateNotifier extends StateNotifier<SplashState> {
  final AuthenticationRepository authenticationRepository;
  final CredentialRepository credentialRepository;
  final UserRepository userRepository;

  SplashStateNotifier(
      {required this.authenticationRepository,
      required this.credentialRepository,
      required this.userRepository})
      : super(const SplashState.initial());

  Future<void> initializeApp() async {
    state = const SplashState.checking();
    final internetConnected = await _checkInternetConnection();
    if (!internetConnected) {
      state = const SplashState.noInternet();
      return;
    }

    final isUserAuthenticated = await _checkUserAuthenticated();
    state = isUserAuthenticated? const SplashState.authenticated(): const SplashState.unauthenticated();
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<bool> _checkUserAuthenticated() async {
    final hasCredential = await credentialRepository.hasCredential();
    if (hasCredential) {
      final credential = await credentialRepository.getCredential();
      credential.fold(
          (_) => false,
          (token) => authenticationRepository
              .updateHeader(data: {'Authorization': token.access_token}));
      final eitherType = await authenticationRepository.getProfile();
      return eitherType.fold((_) => false, (user) async {
        final saved = await userRepository.saveUser(user: user);
        return saved ? true : false;
      });
    } else {
      return false;
    }
  }
}
