import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../auth/presentation/auth_controller.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  Future<void> _logout() async {
    await ref.read(authControllerProvider.notifier).logout();
    if (!mounted) return;
    context.go('/auth/login');
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const _HomeTab(),
      const _RequestsTab(),
      const _BidsTab(),
      const _ProfileTab(),
    ];

    final items = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.dashboard_outlined),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.assignment_outlined),
        label: 'Requests',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.handshake_outlined),
        label: 'Bids',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: 'Profile',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wellth'),
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: _logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    // Map to your Figma "Home / Dashboard" design (stats, cards, quick actions)
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Text(
            'Welcome to Wellth',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Overview of your care requests, upcoming bookings, and notifications.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.assignment_outlined),
              title: const Text('Create a new care request'),
              subtitle: const Text('Tell us what support you need'),
              onTap: () {
                // TODO: context.go('/home/requests/new');
              },
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text('Notifications'),
              subtitle: const Text('Review updates from providers'),
              onTap: () {
                // TODO: context.go('/notifications');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _RequestsTab extends StatelessWidget {
  const _RequestsTab();

  @override
  Widget build(BuildContext context) {
    // Map this to your Figma "My Requests" list
    return const Center(child: Text('Requests list will be displayed here'));
  }
}

class _BidsTab extends StatelessWidget {
  const _BidsTab();

  @override
  Widget build(BuildContext context) {
    // Map this to your Figma "Bids / Offers" list
    return const Center(
      child: Text('Bids from providers will be displayed here'),
    );
  }
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context) {
    // Map this to your Figma "Profile" or "Account" screen
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Text('Profile', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: const Text('Your details'),
              subtitle: const Text('View and edit your personal information'),
              onTap: () {
                // TODO: go to /profile/details
              },
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: const Icon(Icons.security_outlined),
              title: const Text('Security & MFA'),
              subtitle: const Text('Manage MFA and password'),
              onTap: () {
                // TODO: go to /profile/security
              },
            ),
          ),
        ],
      ),
    );
  }
}
