enum AuthStatus { unknown, unauthenticated, authenticated }

class AuthState {
  final AuthStatus status;
  final bool isFirstLaunch;
  final bool isProfileComplete;

  const AuthState({
    required this.status,
    required this.isFirstLaunch,
    required this.isProfileComplete,
  });

  AuthState copyWith({
    AuthStatus? status,
    bool? isFirstLaunch,
    bool? isProfileComplete,
  }) {
    return AuthState(
      status: status ?? this.status,
      isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch,
      isProfileComplete: isProfileComplete ?? this.isProfileComplete,
    );
  }

  static const initial = AuthState(
    status: AuthStatus.unknown,
    isFirstLaunch: true,
    isProfileComplete: false,
  );
}
