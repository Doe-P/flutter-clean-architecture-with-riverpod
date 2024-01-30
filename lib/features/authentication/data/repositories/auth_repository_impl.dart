import 'package:product_store_app/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:product_store_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:product_store_app/shared/domain/models/either.dart';
import 'package:product_store_app/shared/domain/models/model.dart';
import 'package:product_store_app/shared/exceptions/http_exception.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository{
  final LoginUserDataSource dataSource;

  AuthenticationRepositoryImpl({required this.dataSource});

  @override
  Future<Either<AppException, UserCredentials>> login({required User user}) {
    return dataSource.login(user: user);
  }

  @override
  Future<Either<AppException, User>> getProfile() {
    return dataSource.getProfile();
  }

  @override
  void updateHeader({required Map<String, dynamic> data}) {
    dataSource.updateHeader(data: data);
  }

}