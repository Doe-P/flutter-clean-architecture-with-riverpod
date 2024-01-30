import 'package:product_store_app/shared/domain/models/either.dart';
import 'package:product_store_app/shared/exceptions/http_exception.dart';

import '../../../../shared/domain/models/model.dart';

abstract class AuthenticationRepository {
  Future<Either<AppException, UserCredentials>> login({required User user});
  Future<Either<AppException, User>> getProfile();
  void updateHeader({required Map<String, dynamic> data});
}