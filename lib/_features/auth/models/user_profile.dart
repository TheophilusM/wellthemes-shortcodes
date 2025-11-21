// User Profile Model
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
sealed class UserProfile with _$UserProfile {
  const factory UserProfile({
    String? title,
    String? gender,
    required int id,
    String? middleNames,
    String? phoneNumber,
    DateTime? dateOfBirth,
    required String email,
    required String surname,
    required String firstName,
    required String countryCode,
    required String mfaMethod,
    required String referralCode,
    required bool isGoogleOrigin,

    // Nested objects
    required UserAudit audit,
    required NextOfKin? nextOfKin,
    required ProfileStatus profileStatus,
    required List<UserAddresses> addresses,
    required List<UserSession> sessions,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
sealed class UserAudit with _$UserAudit {
  const factory UserAudit({
    required int loginAttempts,
    DateTime? lastFailedLogin,
    required bool isMfaEnabled,
    required bool isEmailVerified,
    required bool isPhoneNumberVerified,
    required bool isAccountLocked,
    required bool isAccountActive,
    required bool isOnboarded,
    DateTime? lastLogin,
    required bool isNewsLetterActive,
  }) = _UserAudit;

  factory UserAudit.fromJson(Map<String, dynamic> json) =>
      _$UserAuditFromJson(json);
}

@freezed
sealed class ProfileStatus with _$ProfileStatus {
  const factory ProfileStatus({
    required bool isOnboarded,
    required bool hasAddress,
    required bool hasNextOfKin,
    required int profileCompletionPercentage,
    required DateTime dateLastModified,
  }) = _ProfileStatus;

  factory ProfileStatus.fromJson(Map<String, dynamic> json) =>
      _$ProfileStatusFromJson(json);
}

@freezed
sealed class NextOfKin with _$NextOfKin {
  const factory NextOfKin({
    required int id,
    required String firstName,
    String? middleNames,
    required String surname,
    String? gender,
    required String relationship,
    required String email,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? notes,
    required DateTime dateCreated,
    required DateTime dateLastModified,
  }) = _NextOfKin;

  factory NextOfKin.fromJson(Map<String, dynamic> json) =>
      _$NextOfKinFromJson(json);
}

@freezed
sealed class UserAddresses with _$UserAddresses {
  const factory UserAddresses({
    required int id,
    required String addressLine1,
    String? addressLine2,
    required String city,
    String? state,
    String? zipCode,
    required String country,
    required String countryCode,
    required String addressType,
    required bool isDefault,
    required bool isActive,
    required double latitude,
    required double longitude,
    required DateTime dateCreated,
    required DateTime dateLastModified,
  }) = _UserAddresses;

  factory UserAddresses.fromJson(Map<String, dynamic> json) =>
      _$UserAddressesFromJson(json);
}

@freezed
sealed class UserSession with _$UserSession {
  const factory UserSession({
    required int id,
    required String location,
    required String deviceIdentifier,
    required String ipAddress,
    required String userAgent,
    required String platform,
    required String osVersion,
    required String appVersion,
    required String deviceModel,
    required DateTime expiresAt,
    required DateTime createdAt,
  }) = _UserSession;

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);
}
