import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Your Role')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Role Selection',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 32),
              const Text('This screen is for future role management'),
            ],
          ),
        ),
      ),
    );
  }
}
