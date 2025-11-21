// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  title: json['title'] as String?,
  gender: json['gender'] as String?,
  id: (json['id'] as num).toInt(),
  middleNames: json['middleNames'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  email: json['email'] as String,
  surname: json['surname'] as String,
  firstName: json['firstName'] as String,
  countryCode: json['countryCode'] as String,
  mfaMethod: json['mfaMethod'] as String,
  referralCode: json['referralCode'] as String,
  isGoogleOrigin: json['isGoogleOrigin'] as bool,
  audit: UserAudit.fromJson(json['audit'] as Map<String, dynamic>),
  nextOfKin: json['nextOfKin'] == null
      ? null
      : NextOfKin.fromJson(json['nextOfKin'] as Map<String, dynamic>),
  profileStatus: ProfileStatus.fromJson(
    json['profileStatus'] as Map<String, dynamic>,
  ),
  addresses: (json['addresses'] as List<dynamic>)
      .map((e) => UserAddresses.fromJson(e as Map<String, dynamic>))
      .toList(),
  sessions: (json['sessions'] as List<dynamic>)
      .map((e) => UserSession.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'title': instance.title,
      'gender': instance.gender,
      'id': instance.id,
      'middleNames': instance.middleNames,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'email': instance.email,
      'surname': instance.surname,
      'firstName': instance.firstName,
      'countryCode': instance.countryCode,
      'mfaMethod': instance.mfaMethod,
      'referralCode': instance.referralCode,
      'isGoogleOrigin': instance.isGoogleOrigin,
      'audit': instance.audit,
      'nextOfKin': instance.nextOfKin,
      'profileStatus': instance.profileStatus,
      'addresses': instance.addresses,
      'sessions': instance.sessions,
    };

_UserAudit _$UserAuditFromJson(Map<String, dynamic> json) => _UserAudit(
  loginAttempts: (json['loginAttempts'] as num).toInt(),
  lastFailedLogin: json['lastFailedLogin'] == null
      ? null
      : DateTime.parse(json['lastFailedLogin'] as String),
  isMfaEnabled: json['isMfaEnabled'] as bool,
  isEmailVerified: json['isEmailVerified'] as bool,
  isPhoneNumberVerified: json['isPhoneNumberVerified'] as bool,
  isAccountLocked: json['isAccountLocked'] as bool,
  isAccountActive: json['isAccountActive'] as bool,
  isOnboarded: json['isOnboarded'] as bool,
  lastLogin: json['lastLogin'] == null
      ? null
      : DateTime.parse(json['lastLogin'] as String),
  isNewsLetterActive: json['isNewsLetterActive'] as bool,
);

Map<String, dynamic> _$UserAuditToJson(_UserAudit instance) =>
    <String, dynamic>{
      'loginAttempts': instance.loginAttempts,
      'lastFailedLogin': instance.lastFailedLogin?.toIso8601String(),
      'isMfaEnabled': instance.isMfaEnabled,
      'isEmailVerified': instance.isEmailVerified,
      'isPhoneNumberVerified': instance.isPhoneNumberVerified,
      'isAccountLocked': instance.isAccountLocked,
      'isAccountActive': instance.isAccountActive,
      'isOnboarded': instance.isOnboarded,
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'isNewsLetterActive': instance.isNewsLetterActive,
    };

_ProfileStatus _$ProfileStatusFromJson(Map<String, dynamic> json) =>
    _ProfileStatus(
      isOnboarded: json['isOnboarded'] as bool,
      hasAddress: json['hasAddress'] as bool,
      hasNextOfKin: json['hasNextOfKin'] as bool,
      profileCompletionPercentage: (json['profileCompletionPercentage'] as num)
          .toInt(),
      dateLastModified: DateTime.parse(json['dateLastModified'] as String),
    );

Map<String, dynamic> _$ProfileStatusToJson(_ProfileStatus instance) =>
    <String, dynamic>{
      'isOnboarded': instance.isOnboarded,
      'hasAddress': instance.hasAddress,
      'hasNextOfKin': instance.hasNextOfKin,
      'profileCompletionPercentage': instance.profileCompletionPercentage,
      'dateLastModified': instance.dateLastModified.toIso8601String(),
    };

_NextOfKin _$NextOfKinFromJson(Map<String, dynamic> json) => _NextOfKin(
  id: (json['id'] as num).toInt(),
  firstName: json['firstName'] as String,
  middleNames: json['middleNames'] as String?,
  surname: json['surname'] as String,
  gender: json['gender'] as String?,
  relationship: json['relationship'] as String,
  email: json['email'] as String,
  phoneNumber: json['phoneNumber'] as String?,
  dateOfBirth: json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String),
  notes: json['notes'] as String?,
  dateCreated: DateTime.parse(json['dateCreated'] as String),
  dateLastModified: DateTime.parse(json['dateLastModified'] as String),
);

Map<String, dynamic> _$NextOfKinToJson(_NextOfKin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleNames': instance.middleNames,
      'surname': instance.surname,
      'gender': instance.gender,
      'relationship': instance.relationship,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'notes': instance.notes,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'dateLastModified': instance.dateLastModified.toIso8601String(),
    };

_UserAddresses _$UserAddressesFromJson(Map<String, dynamic> json) =>
    _UserAddresses(
      id: (json['id'] as num).toInt(),
      addressLine1: json['addressLine1'] as String,
      addressLine2: json['addressLine2'] as String?,
      city: json['city'] as String,
      state: json['state'] as String?,
      zipCode: json['zipCode'] as String?,
      country: json['country'] as String,
      countryCode: json['countryCode'] as String,
      addressType: json['addressType'] as String,
      isDefault: json['isDefault'] as bool,
      isActive: json['isActive'] as bool,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      dateLastModified: DateTime.parse(json['dateLastModified'] as String),
    );

Map<String, dynamic> _$UserAddressesToJson(_UserAddresses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'country': instance.country,
      'countryCode': instance.countryCode,
      'addressType': instance.addressType,
      'isDefault': instance.isDefault,
      'isActive': instance.isActive,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'dateLastModified': instance.dateLastModified.toIso8601String(),
    };

_UserSession _$UserSessionFromJson(Map<String, dynamic> json) => _UserSession(
  id: (json['id'] as num).toInt(),
  location: json['location'] as String,
  deviceIdentifier: json['deviceIdentifier'] as String,
  ipAddress: json['ipAddress'] as String,
  userAgent: json['userAgent'] as String,
  platform: json['platform'] as String,
  osVersion: json['osVersion'] as String,
  appVersion: json['appVersion'] as String,
  deviceModel: json['deviceModel'] as String,
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$UserSessionToJson(_UserSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'deviceIdentifier': instance.deviceIdentifier,
      'ipAddress': instance.ipAddress,
      'userAgent': instance.userAgent,
      'platform': instance.platform,
      'osVersion': instance.osVersion,
      'appVersion': instance.appVersion,
      'deviceModel': instance.deviceModel,
      'expiresAt': instance.expiresAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
