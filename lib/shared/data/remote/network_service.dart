import 'package:product_store_app/shared/domain/models/either.dart';
import 'package:product_store_app/shared/domain/models/model.dart';
import 'package:product_store_app/shared/exceptions/http_exception.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters,});

  Future<Either<AppException, Response>> post(String endpoint,
      {Map<String, dynamic>? data,});
}