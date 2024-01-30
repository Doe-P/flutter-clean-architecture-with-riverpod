import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_store_app/features/authentication/domain/providers/login_provider.dart';
import 'package:product_store_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:product_store_app/features/authentication/presentation/providers/state/auth_notifier.dart';
import 'package:product_store_app/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:product_store_app/services/credential/domain/providers/credential_provider.dart';
import 'package:product_store_app/services/credential/domain/repositories/credential_repository.dart';

final authStateNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final AuthenticationRepository authenticationRepository = ref.watch(authRepositoryProvider);
  final CredentialRepository credentialRepository = ref.watch(credentialRepositoryProvider);
  return AuthNotifier(
    authRepository: authenticationRepository,
    credentialRepository: credentialRepository,
  );
});
