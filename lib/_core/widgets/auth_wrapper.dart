// Auth Wrapper  
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    // Show splash screen during initialization
    if (authState.isInitializing) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // MFA verification required
    if (authState.requiresMfa) {
      return const MfaVerificationScreen();
    }

    // User is authenticated
    if (authState.isAuthenticated && authState.user != null) {
      // Check if user needs onboarding by fetching profile
      return FutureBuilder(
        future: ref.read(authControllerProvider.notifier).fetchProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasData && snapshot.data != null) {
            final profile = snapshot.data!;

            // Check if email is verified
            if (!profile.userAudit.emailVerified) {
              return const EmailVerificationScreen();
            }

            // Check if user needs onboarding
            if (!profile.userAudit.onboarded) {
              return const OnboardingScreen();
            }

            // Check if account is active
            if (!profile.userAudit.accountActive || profile.userAudit.accountLocked) {
              return const AccountSuspendedScreen();
            }

            // All good, go to home
            return const HomeScreen();
          }

          // Error fetching profile, logout and show login
          Future.microtask(() => ref.read(authControllerProvider.notifier).logout());
          return const LoginScreen();
        },
      );
    }

    // User is not authenticated
    return const LoginScreen();
  }
}

// Placeholder screens - Replace with your actual screens
class MfaVerificationScreen extends StatelessWidget {
  const MfaVerificationScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('MFA Screen')));
}

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Email Verification Screen')));
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Onboarding Screen')));
}

class AccountSuspendedScreen extends StatelessWidget {
  const AccountSuspendedScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Account Suspended')));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Home Screen')));
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Login Screen')));
}
