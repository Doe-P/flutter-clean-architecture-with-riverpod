import 'package:product_store_app/shared/domain/models/model.dart';
import 'package:product_store_app/shared/exceptions/http_exception.dart';

import '../../../../shared/domain/models/either.dart';

abstract class CredentialRepository {
  Future<Either<AppException, UserCredentials>> getCredential();
  Future<bool> saveCredential({required UserCredentials credentials});
  Future<bool> clearCredential();
  Future<bool> hasCredential();
}