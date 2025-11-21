// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JwtUser _$JwtUserFromJson(Map<String, dynamic> json) => _JwtUser(
  email: json['email'] as String,
  fullName: json['fullName'] as String,
  country: json['country'] as String,
  roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
  mfaEnabled: json['mfaEnabled'] as bool,
  userId: (json['userId'] as num).toInt(),
);

Map<String, dynamic> _$JwtUserToJson(_JwtUser instance) => <String, dynamic>{
  'email': instance.email,
  'fullName': instance.fullName,
  'country': instance.country,
  'roles': instance.roles,
  'mfaEnabled': instance.mfaEnabled,
  'userId': instance.userId,
};
