import 'package:product_store_app/shared/exceptions/http_exception.dart';

import 'either.dart';

class Response {
  final int statusCode;
  final String? statusMessage;
  final dynamic data;

  Response({required this.statusCode, required this.statusMessage, required this.data});

  @override
  String toString(){
    return 'statusCode=$statusCode\nstatusMessage=$statusMessage\n data=$data';
  }
}

extension ResponseExtension on Response {
  Right<AppException, Response> get toRight => Right(this);
}