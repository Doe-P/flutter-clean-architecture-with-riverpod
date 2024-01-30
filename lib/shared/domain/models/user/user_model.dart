import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class User with _$User {
 factory User({
    @Default('') String email,
    @Default('') String password,
    @Default('') String name,
    @Default('') String role,
    @Default('') String avatar,
    DateTime? creationAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(dynamic json) => _$UserFromJson(json);
}
