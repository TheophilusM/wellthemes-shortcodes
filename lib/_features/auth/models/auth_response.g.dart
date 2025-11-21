// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) =>
    _AuthResponse(
      message: json['message'] as String,
      data: AuthData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseToJson(_AuthResponse instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};

_AuthData _$AuthDataFromJson(Map<String, dynamic> json) => _AuthData(
  requiresMfa: json['requiresMfa'] as bool,
  accessToken: json['accessToken'] as String?,
  refreshToken: json['refreshToken'] as String?,
);

Map<String, dynamic> _$AuthDataToJson(_AuthData instance) => <String, dynamic>{
  'requiresMfa': instance.requiresMfa,
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};

_ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) =>
    _ApiResponse(message: json['message'] as String);

Map<String, dynamic> _$ApiResponseToJson(_ApiResponse instance) =>
    <String, dynamic>{'message': instance.message};
