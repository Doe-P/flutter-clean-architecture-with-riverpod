import 'package:product_store_app/services/credential/data/datasource/credential_local_datasource.dart';
import 'package:product_store_app/services/credential/domain/repositories/credential_repository.dart';
import 'package:product_store_app/shared/domain/models/credential/user_credentials_model.dart';
import 'package:product_store_app/shared/domain/models/either.dart';
import 'package:product_store_app/shared/exceptions/http_exception.dart';

class CredentialRepositoryImpl implements CredentialRepository {
  final CredentialDataSource dataSource;

  CredentialRepositoryImpl({required this.dataSource});

  @override
  Future<bool> clearCredential() {
    return dataSource.clearCredential();
  }

  @override
  Future<Either<AppException, UserCredentials>> getCredential() {
    return dataSource.getCredential();
  }

  @override
  Future<bool> hasCredential() {
    return dataSource.hasCredential();
  }

  @override
  Future<bool> saveCredential({required UserCredentials credentials}) {
    return dataSource.saveCredential(credentials: credentials);
  }

}