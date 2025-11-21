// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  id: (json['id'] as num).toInt(),
  firstName: json['firstName'] as String,
  surname: json['surname'] as String,
  email: json['email'] as String,
  countryCode: json['countryCode'] as String,
  pictureUrl: json['pictureUrl'] as String?,
  referralCode: json['referralCode'] as String,
  roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
  userAudit: UserAudit.fromJson(json['userAudit'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'surname': instance.surname,
      'email': instance.email,
      'countryCode': instance.countryCode,
      'pictureUrl': instance.pictureUrl,
      'referralCode': instance.referralCode,
      'roles': instance.roles,
      'userAudit': instance.userAudit,
    };

_UserAudit _$UserAuditFromJson(Map<String, dynamic> json) => _UserAudit(
  emailVerified: json['emailVerified'] as bool,
  phoneNumberVerified: json['phoneNumberVerified'] as bool,
  mfaEnabled: json['mfaEnabled'] as bool,
  onboarded: json['onboarded'] as bool,
  accountActive: json['accountActive'] as bool,
  accountLocked: json['accountLocked'] as bool,
  lastLogin: json['lastLogin'] as String?,
);

Map<String, dynamic> _$UserAuditToJson(_UserAudit instance) =>
    <String, dynamic>{
      'emailVerified': instance.emailVerified,
      'phoneNumberVerified': instance.phoneNumberVerified,
      'mfaEnabled': instance.mfaEnabled,
      'onboarded': instance.onboarded,
      'accountActive': instance.accountActive,
      'accountLocked': instance.accountLocked,
      'lastLogin': instance.lastLogin,
    };
