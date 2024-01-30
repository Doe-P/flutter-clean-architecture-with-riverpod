import 'package:product_store_app/services/user/data/datasource/user_local_datasource.dart';
import 'package:product_store_app/services/user/domain/repositories/user_repository.dart';
import 'package:product_store_app/shared/domain/models/either.dart';
import 'package:product_store_app/shared/domain/models/user/user_model.dart';
import 'package:product_store_app/shared/exceptions/http_exception.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource dataSource;
  UserRepositoryImpl({required this.dataSource});

  @override
  Future<bool> deleteUser() {
    return dataSource.deleteUser();
  }

  @override
  Future<Either<AppException, User>> getUser() {
    return dataSource.getUser();
  }

  @override
  Future<bool> hasUser() {
    return dataSource.hasUser();
  }

  @override
  Future<bool> saveUser({required User user}) {
    return dataSource.saveUser(user: user);
  }

}