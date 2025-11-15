import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:wellth_app/features/auth/domain/auth_state.dart';
import 'package:wellth_app/features/auth/presentation/auth_controller.dart';
import 'package:wellth_app/features/auth/presentation/complete_profile_screen.dart';
import 'package:wellth_app/features/auth/presentation/home_screen.dart';
import 'package:wellth_app/features/auth/presentation/login_screen.dart';
import 'package:wellth_app/features/auth/presentation/signup_screen.dart';
import 'package:wellth_app/features/auth/presentation/onboarding_screen.dart';
import 'package:wellth_app/features/auth/presentation/mfa_screen.dart';

/// Listenable that rebuilds GoRouter when an auth stream emits a new value.
/// This is the same pattern used in the official go_router + Riverpod examples.
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);
  final authNotifier = ref.read(authControllerProvider.notifier);

  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    // When authController emits on its stream, this notifies GoRouter to re-run redirect
    refreshListenable: GoRouterRefreshStream(authNotifier.stream),
    redirect: (context, state) {
      final loc = state.matchedLocation;
      final isSplash = loc == '/splash';
      final isOnboarding = loc.startsWith('/onboarding');
      final isAuthRoute = loc.startsWith('/auth');

      final status = authState.status;
      final loggedIn = status == AuthStatus.authenticated;
      final firstLaunch = authState.isFirstLaunch;
      final profileComplete = authState.isProfileComplete;

      // 1. While still figuring out first-launch / tokens
      if (status == AuthStatus.unknown) {
        return isSplash ? null : '/splash';
      }

      // 2. First-ever launch → onboarding
      if (firstLaunch && !loggedIn && !isOnboarding && !isAuthRoute) {
        return '/onboarding';
      }

      final isPublicRoute =
          isSplash || isOnboarding || isAuthRoute || loc == '/';

      // 3. Not logged in & trying to hit a private route
      if (!loggedIn && !isPublicRoute) {
        final from = Uri.encodeComponent(loc);
        return '/auth/login?from=$from';
      }

      // 4. Logged in but lingering on splash / onboarding / auth
      if (loggedIn && (isSplash || isOnboarding || isAuthRoute)) {
        if (!profileComplete) {
          return '/profile/complete';
        }
        return '/home';
      }

      // 5. No redirect needed
      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const _SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/auth/login',
        name: 'login',
        builder: (context, state) {
          final from = state.uri.queryParameters['from'];
          return LoginScreen(redirectTo: from);
        },
      ),
      GoRoute(
        path: '/auth/signup',
        name: 'signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/auth/mfa',
        name: 'mfa',
        builder: (context, state) => const MfaScreen(),
      ),
      GoRoute(
        path: '/profile/complete',
        name: 'profile_complete',
        builder: (context, state) => const CompleteProfileScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
});

class _SplashScreen extends StatelessWidget {
  const _SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Later: replace this with your Figma splash (logo, gradient, etc.)
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
