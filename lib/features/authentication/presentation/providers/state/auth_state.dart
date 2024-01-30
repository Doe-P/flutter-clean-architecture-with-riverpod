import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_store_app/shared/exceptions/http_exception.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.success() = Success;
  const factory AuthState.failure(AppException exception) = Failure;
}