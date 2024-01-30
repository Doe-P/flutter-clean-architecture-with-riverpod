import 'dart:convert';

import 'package:product_store_app/shared/data/local/storage_service.dart';
import 'package:product_store_app/shared/globals.dart';

import '../../../../shared/domain/models/either.dart';
import '../../../../shared/domain/models/model.dart';
import '../../../../shared/exceptions/http_exception.dart';

abstract class CredentialDataSource {
  String get storageKey;
  Future<Either<AppException, UserCredentials>> getCredential();
  Future<bool> saveCredential({required UserCredentials credentials});
  Future<bool> clearCredential();
  Future<bool> hasCredential();
}

class CredentialLocalDataSource extends CredentialDataSource {
  final StorageService storageService;

  CredentialLocalDataSource({required this.storageService});

  @override
  Future<bool> clearCredential() async {
    return await storageService.remove(storageKey);
  }

  @override
  Future<Either<AppException, UserCredentials>> getCredential() async {
    final credentials = await storageService.get(storageKey);
    if(credentials == null){
      return Left(AppException(message: 'Credential not found', statusCode: 404, identifier: 'CredentialLocalDataSource'));
    }
    return Right(UserCredentials.fromJson(credentials));
  }

  @override
  Future<bool> hasCredential() async{
    return await storageService.has(storageKey);
  }

  @override
  Future<bool> saveCredential({required UserCredentials credentials}) async {
    return await storageService.set(storageKey, jsonEncode(credentials.toJson()));
  }

  @override
  String get storageKey => USER_CREDENTIALS;
}