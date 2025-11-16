// lib/app/router.dart
import 'package:Wellth/features/onboarding/onboarding_screen.dart';
import 'package:Wellth/features/splash/splash_screen.dart';
import 'package:Wellth/features/user/screens/profile_complete_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/signup_screen.dart';
import '../features/auth/screens/role_selection_screen.dart';
import '../features/auth/screens/forgot_password_screen.dart';
import '../features/home/home_screen.dart';
import '../features/auth/controllers/auth_controller.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isAuthenticated = authState.isAuthenticated;
      final isOnboarded = authState.user?.isOnboarded ?? false;
      final currentPath = state.matchedLocation;

      // Public routes that don't need auth
      const publicRoutes = [
        '/splash',
        '/onboarding',
        '/auth/login',
        '/auth/signup',
        '/auth/role',
        '/auth/forgot-password',
        '/auth/reset-password',
        '/auth/verify-email',
        '/auth/mfa',
      ];

      // If on a public route and authenticated, redirect to home
      if (publicRoutes.any((route) => currentPath.startsWith(route))) {
        if (isAuthenticated) {
          // Check if profile is complete
          if (!isOnboarded) {
            return '/profile/complete';
          }
          return '/home';
        }
        // Not authenticated, stay on public route
        return null;
      }

      // Private routes - require authentication
      if (!isAuthenticated) {
        // Save the intended destination
        return '/auth/login?from=$currentPath';
      }

      // Check if profile is complete for authenticated users
      if (!isOnboarded && currentPath != '/profile/complete') {
        return '/profile/complete';
      }

      // Allow navigation
      return null;
    },
    routes: [
      // Splash
      GoRoute(
        path: '/splash',
        name: 'splash',
        pageBuilder: (context, state) =>
            NoTransitionPage(key: state.pageKey, child: const SplashScreen()),
      ),

      // Onboarding
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),

      // Auth Routes
      GoRoute(
        path: '/auth/login',
        name: 'login',
        pageBuilder: (context, state) {
          final from = state.uri.queryParameters['from'];
          return CustomTransitionPage(
            key: state.pageKey,
            child: LoginScreen(redirectTo: from),
            transitionsBuilder: _slideTransition,
          );
        },
      ),

      GoRoute(
        path: '/auth/signup',
        name: 'signup',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SignUpScreen(),
          transitionsBuilder: _slideTransition,
        ),
      ),

      GoRoute(
        path: '/auth/role',
        name: 'role-selection',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const RoleSelectionScreen(),
          transitionsBuilder: _slideTransition,
        ),
      ),

      GoRoute(
        path: '/auth/forgot-password',
        name: 'forgot-password',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ForgotPasswordScreen(),
          transitionsBuilder: _slideTransition,
        ),
      ),

      GoRoute(
        path: '/auth/reset-password',
        name: 'reset-password',
        pageBuilder: (context, state) {
          final token = state.uri.queryParameters['token'] ?? '';
          return CustomTransitionPage(
            key: state.pageKey,
            child: ResetPasswordScreen(token: token),
            transitionsBuilder: _slideTransition,
          );
        },
      ),

      GoRoute(
        path: '/auth/verify-email',
        name: 'verify-email',
        pageBuilder: (context, state) {
          final token = state.uri.queryParameters['token'];
          return CustomTransitionPage(
            key: state.pageKey,
            child: VerifyEmailScreen(token: token),
            transitionsBuilder: _slideTransition,
          );
        },
      ),

      GoRoute(
        path: '/auth/mfa',
        name: 'mfa',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MfaScreen(),
          transitionsBuilder: _slideTransition,
        ),
      ),

      // Home (Private)
      GoRoute(
        path: '/home',
        name: 'home',
        pageBuilder: (context, state) =>
            NoTransitionPage(key: state.pageKey, child: const HomeScreen()),
      ),

      // Profile Complete (Private)
      GoRoute(
        path: '/profile/complete',
        name: 'profile-complete',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ProfileCompleteScreen(),
          transitionsBuilder: _slideTransition,
        ),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 80, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              state.matchedLocation,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
});

// Custom slide transition from right
Widget _slideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  const curve = Curves.easeInOut;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(position: animation.drive(tween), child: child);
}
