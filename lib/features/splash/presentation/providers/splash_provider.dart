import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_store_app/features/authentication/domain/providers/login_provider.dart';
import 'package:product_store_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:product_store_app/features/splash/presentation/providers/state/splash_state.dart';
import 'package:product_store_app/features/splash/presentation/providers/state/splash_state_notifier.dart';
import 'package:product_store_app/services/credential/domain/providers/credential_provider.dart';
import 'package:product_store_app/services/credential/domain/repositories/credential_repository.dart';
import 'package:product_store_app/services/user/domain/providers/user_provider.dart';
import 'package:product_store_app/services/user/domain/repositories/user_repository.dart';

final splashStateNotifierProvider =
    StateNotifierProvider<SplashStateNotifier, SplashState>((ref) {
  final AuthenticationRepository authenticationRepository =
      ref.watch(authRepositoryProvider);
  final UserRepository userRepository = ref.watch(userCacheRepositoryProvider);
  final CredentialRepository credentialRepository =
      ref.watch(credentialRepositoryProvider);
  return SplashStateNotifier(
    authenticationRepository: authenticationRepository,
    credentialRepository: credentialRepository,
    userRepository: userRepository,
  )..initializeApp();
});
