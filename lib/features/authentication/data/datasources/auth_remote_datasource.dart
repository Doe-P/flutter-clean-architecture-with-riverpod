import 'package:product_store_app/shared/data/remote/remote.dart';
import 'package:product_store_app/shared/domain/models/model.dart';
import 'package:product_store_app/shared/exceptions/http_exception.dart';

import '../../../../shared/domain/models/either.dart';

abstract class LoginUserDataSource {
  Future<Either<AppException, UserCredentials>> login({required User user});

  Future<Either<AppException, User>> getProfile();

  void updateHeader({required Map<String, dynamic> data});
}

class LoginUserRemoteDataSource implements LoginUserDataSource {
  final NetworkService networkService;

  LoginUserRemoteDataSource({required this.networkService});

  @override
  Future<Either<AppException, UserCredentials>> login(
      {required User user}) async {
    try {
      final eitherType = await networkService.post(
        '/auth/login',
        data: user.toJson(),
      );
      return eitherType.fold((exception) => Left(exception), (response) {
        final credentials = UserCredentials.fromJson(response.data);

        /// update the token for requests
        networkService.updateHeader({
          'Authorization': credentials.access_token,
        });
        return Right(credentials);
      });
    } catch (error) {
      return Left(AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${error.toString()}\nLoginUserRemoteDataSource.login'));
    }
  }

  @override
  Future<Either<AppException, User>> getProfile() async {
    try {
      final eitherType = await networkService.get('/auth/profile');
      return eitherType.fold((exception) => Left(exception), (response) {
        final user = User.fromJson(response.data);
        return Right(user);
      });
    } catch (e) {
      return Left(AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nLoginUserRemoteDataSource.getProfile'));
    }
  }

  @override
  void updateHeader({required Map<String, dynamic> data}) {
    networkService.updateHeader(data);
  }
}
