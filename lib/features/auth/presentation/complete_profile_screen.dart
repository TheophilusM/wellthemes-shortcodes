import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Style this based on your Figma "complete profile" or "onboarding step 2" screen
    return Scaffold(
      appBar: AppBar(title: const Text('Complete your profile')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Text(
                'You’re almost there!',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Add a few more details so we can match you with the right services and providers.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              // TODO: replace with actual profile fields (phone, role selection, address, etc.)
              const Expanded(
                child: Center(
                  child: Text(
                    'Profile completion flow will go here.\n'
                    'For now, tap "Continue" to go to Home.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // For now just go to the main shell
                  context.go('/home');
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
