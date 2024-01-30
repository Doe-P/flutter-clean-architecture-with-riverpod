import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:product_store_app/main/app_env.dart';
import 'package:product_store_app/shared/data/remote/remote.dart';
import 'package:product_store_app/shared/domain/models/either.dart';
import 'package:product_store_app/shared/domain/models/response.dart'
    as response;
import 'package:product_store_app/shared/exceptions/http_exception.dart';
import 'package:product_store_app/shared/globals.dart';
import 'package:product_store_app/shared/mixins/exception_handler_mixin.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;

  DioNetworkService(this.dio){
    if(!kTestMode){
      dio.options = dioBaseOptions;
      if(kDebugMode){
        dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
    baseUrl: baseUrl,
    headers: headers,
  );

  @override
  String get baseUrl => EnvInfo.connectionStrings;

  @override
  Future<Either<AppException, response.Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Future<Either<AppException, response.Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  }) {
    final res = handleException(
      () => dio.post(endpoint, data: data),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Map<String, dynamic> updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if(!kTestMode){
      dio.options.headers = header;
    }
    return header;
  }
}
