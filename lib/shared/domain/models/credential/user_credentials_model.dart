import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_credentials_model.freezed.dart';
part 'user_credentials_model.g.dart';

@freezed
class UserCredentials with _$UserCredentials {
  factory UserCredentials({
    @Default('') String access_token,
    @Default('') String refresh_token,
}) = _UserCredentials;
  factory UserCredentials.fromJson(dynamic json) => _$UserCredentialsFromJson(json);
}