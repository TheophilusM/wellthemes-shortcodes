import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final appRouter = GoRouter(
  initialLocation: '/onboarding', // or '/auth/login'
  routes: [
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) =>
          const Scaffold(body: Center(child: Text('Onboarding placeholder'))),
    ),
    GoRoute(
      path: '/auth/login',
      name: 'login',
      builder: (context, state) =>
          const Scaffold(body: Center(child: Text('Login placeholder'))),
    ),
    GoRoute(
      path: '/auth/signup',
      name: 'signup',
      builder: (context, state) =>
          const Scaffold(body: Center(child: Text('Signup placeholder'))),
    ),
  ],
);
