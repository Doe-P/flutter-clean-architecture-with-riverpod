// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_credentials_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserCredentialsImpl _$$UserCredentialsImplFromJson(
        Map<String, dynamic> json) =>
    _$UserCredentialsImpl(
      access_token: json['access_token'] as String? ?? '',
      refresh_token: json['refresh_token'] as String? ?? '',
    );

Map<String, dynamic> _$$UserCredentialsImplToJson(
        _$UserCredentialsImpl instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
    };
