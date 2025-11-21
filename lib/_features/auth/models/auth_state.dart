// Auth State Model  
import 'package:freezed_annotation/freezed_annotation.dart';
import 'jwt_user.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isAuthenticated,
    @Default(false) bool isLoading,
    @Default(false) bool isInitializing,
    JwtUser? user,
    String? error,
    @Default(false) bool requiresMfa,
  }) = _AuthState;
}
