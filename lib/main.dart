import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '_core/providers/providers.dart';
import '_core/widgets/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        // Override the SharedPreferences provider with actual instance
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wellth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF005F8D),
        ),
        useMaterial3: true,
      ),
      home: const AuthWrapper(),
    );
  }
}

/*
1. Run code generation:
   flutter pub run build_runner build --delete-conflicting-outputs

2. File structure:
   lib/
   ├── main.dart
   ├── _core/
   │   ├── constants/
   │   │   ├── api_constants.dart
   │   │   └── storage_keys.dart
   │   ├── exceptions/
   │   │   └── api_exception.dart
   │   ├── network/
   │   │   ├── api_client.dart
   │   │   └── api_interceptor.dart
   │   ├── providers/
   │   │   └── providers.dart
   │   ├── services/
   │   │   ├── device_info_service.dart
   │   │   ├── storage_service.dart
   │   │   └── token_manager.dart
   │   └── widgets/
   │       └── auth_wrapper.dart
   └── _features/
       └── auth/
           ├── controllers/
           │   └── auth_controller.dart
           ├── models/
           │   ├── auth_request.dart
           │   ├── auth_response.dart
           │   ├── auth_state.dart
           │   ├── jwt_user.dart
           │   └── user_profile.dart
           ├── screens/
           │   ├── login_screen.dart
           │   └── mfa_verification_screen.dart
           └── services/
               └── auth_service.dart

3. Key features implemented:
   - ✅ Token management (in-memory access token, encrypted refresh token)
   - ✅ Automatic token refresh (2 minutes before expiry)
   - ✅ Device fingerprinting
   - ✅ MFA support
   - ✅ Error handling with user-friendly messages
   - ✅ Silent login (session restoration)
   - ✅ Conditional navigation (onboarding, email verification, etc.)
   - ✅ Google Sign In integration (placeholder)
   - ✅ Interceptor for automatic auth header injection
   - ✅ 401 retry with token refresh
   - ✅ Comprehensive state management with Riverpod

4. To customize base URL:
   Change ApiConstants.baseUrl in api_constants.dart

5. To implement Google Sign In:
   Uncomment and complete the _handleGoogleSignIn method in login_screen.dart
   Add google_sign_in to pubspec.yaml

6. Error handling:
   All API errors are caught and displayed in the UI with SnackBars
   Backend error messages are extracted and shown to users
*/