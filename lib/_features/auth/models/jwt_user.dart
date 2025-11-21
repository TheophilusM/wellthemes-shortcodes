// JWT User Model  
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt_user.freezed.dart';
part 'jwt_user.g.dart';

@freezed
sealed class JwtUser with _$JwtUser {
  const factory JwtUser({
    required String email,
    required String fullName,
    required String country,
    required List<String> roles,
    required bool mfaEnabled,
    required int userId,
  }) = _JwtUser;

  factory JwtUser.fromJson(Map<String, dynamic> json) => _$JwtUserFromJson(json);
}