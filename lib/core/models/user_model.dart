// lib/core/models/user_model.dart
class User {
  final int id;
  final String firstName;
  final String surname;
  final String email;
  final String? phoneNumber;
  final String? pictureUrl;
  final String? countryCode;
  final List<String> roles;
  final bool isEmailVerified;
  final bool isMfaEnabled;
  final bool isOnboarded;

  User({
    required this.id,
    required this.firstName,
    required this.surname,
    required this.email,
    this.phoneNumber,
    this.pictureUrl,
    this.countryCode,
    required this.roles,
    required this.isEmailVerified,
    required this.isMfaEnabled,
    required this.isOnboarded,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'] ?? '',
      surname: json['surname'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'],
      pictureUrl: json['pictureUrl'],
      countryCode: json['countryCode'],
      roles: List<String>.from(json['roles'] ?? []),
      isEmailVerified: json['emailVerified'] ?? false,
      isMfaEnabled: json['mfaEnabled'] ?? false,
      isOnboarded: json['onboarded'] ?? false,
    );
  }

  String get fullName => '$firstName $surname';

  bool get isConsumer => roles.contains('CONSUMER');
  bool get isProvider => roles.contains('PROVIDER');
}
