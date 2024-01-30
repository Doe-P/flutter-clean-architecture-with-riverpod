import 'package:product_store_app/shared/domain/models/model.dart';
import 'package:product_store_app/shared/exceptions/http_exception.dart';

import '../../../../shared/domain/models/either.dart';

abstract class UserRepository {
  Future<Either<AppException, User>> getUser();
  Future<bool> saveUser({required User user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}