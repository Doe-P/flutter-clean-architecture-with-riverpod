import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_store_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:product_store_app/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:product_store_app/services/credential/domain/repositories/credential_repository.dart';
import 'package:product_store_app/shared/domain/models/either.dart';
import 'package:product_store_app/shared/domain/models/model.dart';
import 'package:product_store_app/shared/exceptions/http_exception.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository authRepository;
  final CredentialRepository credentialRepository;

  AuthNotifier({required this.authRepository, required this.credentialRepository})
      : super(const AuthState.initial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    state = const AuthState.loading();
    final response = await authRepository.login(user:User(email: email, password: password));

    _updateStateWithResponse(response);
  }

 void _updateStateWithResponse(Either<AppException, UserCredentials> response) async  {
    state = await response.fold((failure) => AuthState.failure(failure), (credentials) async {
      final isSaved = await credentialRepository.saveCredential(credentials: credentials);
      if(isSaved){
        return const AuthState.success();
      }
      return AuthState.failure(CacheFailureException());
    });
 }
}
