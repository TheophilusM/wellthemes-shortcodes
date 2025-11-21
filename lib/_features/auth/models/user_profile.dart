// User Profile Model  
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
sealed class UserProfile with _$UserProfile {
  const factory UserProfile({
    required int id,
    required String firstName,
    required String surname,
    required String email,
    required String countryCode,
    String? pictureUrl,
    required String referralCode,
    required List<String> roles,
    required UserAudit userAudit,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}

@freezed
sealed class UserAudit with _$UserAudit {
  const factory UserAudit({
    required bool emailVerified,
    required bool phoneNumberVerified,
    required bool mfaEnabled,
    required bool onboarded,
    required bool accountActive,
    required bool accountLocked,
    String? lastLogin,
  }) = _UserAudit;

  factory UserAudit.fromJson(Map<String, dynamic> json) => _$UserAuditFromJson(json);
}