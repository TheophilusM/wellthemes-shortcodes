class AuthException implements Exception {
  final String message;
  const AuthException(this.message);

  @override
  String toString() => 'AuthException: $message';
}

class LoginRequest {
  final String email;
  final String password;
  final bool rememberMe;

  LoginRequest({
    required this.email,
    required this.password,
    required this.rememberMe,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'rememberMe': rememberMe,
  };
}

class RegisterRequest {
  final String firstName;
  final String surname;
  final String email;
  final String password;
  final String? referralCode; // optional

  RegisterRequest({
    required this.firstName,
    required this.surname,
    required this.email,
    required this.password,
    this.referralCode,
  });

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'surname': surname,
    'email': email,
    'password': password,
    if (referralCode != null) 'referralCode': referralCode,
  };
}

class MfaVerifyRequest {
  final String code;
  final bool rememberMe;

  MfaVerifyRequest({required this.code, required this.rememberMe});

  Map<String, dynamic> toJson() => {'code': code, 'rememberMe': rememberMe};
}

class ForgotPasswordRequest {
  final String email;
  ForgotPasswordRequest(this.email);

  Map<String, dynamic> toJson() => {'email': email};
}

class ResetPasswordRequest {
  final String newPassword;
  final String token;
  ResetPasswordRequest({required this.newPassword, required this.token});

  Map<String, dynamic> toJson() => {'newPassword': newPassword, 'token': token};
}

class ResendVerificationRequest {
  final String email;
  ResendVerificationRequest(this.email);

  Map<String, dynamic> toJson() => {'email': email};
}

class GoogleLoginRequest {
  final String idToken;
  final bool rememberMe;
  final String? referralCode;

  GoogleLoginRequest({
    required this.idToken,
    required this.rememberMe,
    this.referralCode,
  });

  Map<String, dynamic> toJson() => {
    'idToken': idToken,
    'rememberMe': rememberMe,
    if (referralCode != null) 'referralCode': referralCode,
  };
}

class LoginResult {
  final bool requiresMfa;
  final String? accessToken;
  final String? refreshToken;

  const LoginResult({
    required this.requiresMfa,
    this.accessToken,
    this.refreshToken,
  });
}

class AuthTokens {
  final String accessToken;
  final String refreshToken;

  const AuthTokens({required this.accessToken, required this.refreshToken});
}
