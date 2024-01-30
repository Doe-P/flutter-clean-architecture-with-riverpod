import 'dart:convert';

import 'package:product_store_app/shared/data/local/storage_service.dart';
import 'package:product_store_app/shared/domain/models/model.dart';
import 'package:product_store_app/shared/exceptions/http_exception.dart';
import 'package:product_store_app/shared/globals.dart';

import '../../../../shared/domain/models/either.dart';

abstract class UserDataSource {
  String get storageKey;
  Future<Either<AppException, User>> getUser();
  Future<bool> saveUser({required User user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}

class UserLocalDataSource extends UserDataSource {
  final StorageService storageService;

  UserLocalDataSource({required this.storageService});

  @override
  Future<bool> deleteUser() async {
    return await storageService.remove(storageKey);
  }

  @override
  Future<Either<AppException, User>> getUser() async {
    final user = await storageService.get(storageKey);
    if(user == null){
      return Left(AppException(message: 'User not found', statusCode: 404, identifier: 'UserLocalDataSource'));
    }
    return Right(User.fromJson(user));
  }

  @override
  Future<bool> hasUser() async {
    return await storageService.has(storageKey);
  }

  @override
  Future<bool> saveUser({required User user}) async {
    return await storageService.set(storageKey, jsonEncode(user.toJson()));
  }

  @override
  String get storageKey => USER_STORAGE_KEY;
}