import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:product_store_app/shared/data/remote/remote.dart';
import 'package:product_store_app/shared/domain/models/either.dart';
import 'package:product_store_app/shared/exceptions/http_exception.dart';

import '../domain/models/response.dart' as response;

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, response.Response>>
      handleException<T extends Object>(
          Future<Response<dynamic>> Function() handler,
          {String endpoint = ''}) async {
    try {
      final res = await handler();
      return Right(response.Response(
        statusCode: res.statusCode ?? 200,
        statusMessage: res.statusMessage,
        data: res.data,
      ));
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      log(e.runtimeType.toString());
      switch (e.runtimeType) {
        case SocketException _:
          e as SocketException;
          message = 'Unable to connect to server.';
          statusCode = 0;
          identifier = 'Socket Exception ${e.message}\n at $endpoint';
          break;
        case DioException _:
          e as DioException;
          message = e.response?.data?['message'] ?? 'Internal Error occurred';
          statusCode = e.response?.statusCode ?? 1;
          identifier = 'DioException ${e.message}\n at $endpoint';
          break;
        default:
          message = 'Unknown error occurred';
          statusCode = 2;
          identifier = 'Unknown error ${e.toString()} at $endpoint';
      }
      return Left(AppException(
          message: message, statusCode: statusCode, identifier: identifier));
    }
  }
}
