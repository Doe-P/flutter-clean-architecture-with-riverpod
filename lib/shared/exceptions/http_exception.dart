import 'package:equatable/equatable.dart';
import 'package:product_store_app/shared/domain/models/either.dart';
import 'package:product_store_app/shared/domain/models/model.dart';

class AppException implements Exception {
  final String message;
  final int statusCode;
  final String identifier;

  AppException({required this.message, required this.statusCode, required this.identifier});

  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}

class CacheFailureException extends Equatable implements AppException {
  @override
  String get identifier => 'Cache failure exception';

  @override
  String get message => 'Unable to save user';

  @override
  List<Object?> get props => [message, statusCode, identifier];

  @override
  int get statusCode => 100;
}

extension HttpExceptionExtension on AppException {
  Left<AppException, Response> get toLeft => Left<AppException, Response>(this);
}