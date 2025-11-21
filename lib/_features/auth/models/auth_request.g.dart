// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      rememberMe: json['rememberMe'] as bool? ?? false,
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'rememberMe': instance.rememberMe,
    };

_RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    _RegisterRequest(
      firstName: json['firstName'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      referralCode: json['referralCode'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(_RegisterRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'surname': instance.surname,
      'email': instance.email,
      'password': instance.password,
      'referralCode': instance.referralCode,
    };

_GoogleLoginRequest _$GoogleLoginRequestFromJson(Map<String, dynamic> json) =>
    _GoogleLoginRequest(
      idToken: json['idToken'] as String,
      rememberMe: json['rememberMe'] as bool? ?? false,
      referralCode: json['referralCode'] as String?,
    );

Map<String, dynamic> _$GoogleLoginRequestToJson(_GoogleLoginRequest instance) =>
    <String, dynamic>{
      'idToken': instance.idToken,
      'rememberMe': instance.rememberMe,
      'referralCode': instance.referralCode,
    };

_MfaVerificationRequest _$MfaVerificationRequestFromJson(
  Map<String, dynamic> json,
) => _MfaVerificationRequest(
  code: json['code'] as String,
  rememberMe: json['rememberMe'] as bool? ?? false,
);

Map<String, dynamic> _$MfaVerificationRequestToJson(
  _MfaVerificationRequest instance,
) => <String, dynamic>{
  'code': instance.code,
  'rememberMe': instance.rememberMe,
};

_ForgotPasswordRequest _$ForgotPasswordRequestFromJson(
  Map<String, dynamic> json,
) => _ForgotPasswordRequest(email: json['email'] as String);

Map<String, dynamic> _$ForgotPasswordRequestToJson(
  _ForgotPasswordRequest instance,
) => <String, dynamic>{'email': instance.email};

_ResetPasswordRequest _$ResetPasswordRequestFromJson(
  Map<String, dynamic> json,
) => _ResetPasswordRequest(
  token: json['token'] as String,
  newPassword: json['newPassword'] as String,
);

Map<String, dynamic> _$ResetPasswordRequestToJson(
  _ResetPasswordRequest instance,
) => <String, dynamic>{
  'token': instance.token,
  'newPassword': instance.newPassword,
};
