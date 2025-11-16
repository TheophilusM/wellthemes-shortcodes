import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wellth_app/app/theme.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHeaderSection(context),
            _buildFeatureList(context),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }
}

Widget _buildHeaderSection(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.35,
    width: double.infinity,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [WellthColors.gradientFrom, WellthColors.primary],
      ),
    ),
    child: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Color.from(alpha: 0.2, red: 1, green: 1, blue: 1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 50,
            ),
          ),
          const SizedBox(height: 24),

          Text(
            'Wellth',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 8),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'Connecting care providers with those who need them',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.from(alpha: 0.9, red: 1, green: 1, blue: 1),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildFeatureList(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(32.0),
    child: Column(
      children: const <Widget>[
        _FeatureRow(
          icon: Icons.people_outline,
          iconBgColor: Color.from(
            alpha: 0.12,
            red: 0.298,
            green: 0.686,
            blue: 0.31,
          ),
          iconColor: Color(0xFF4caf50),
          title: 'Find Qualified Professionals',
          subtitle: 'Connect with verified healthcare providers in your area',
        ),
        _FeatureRow(
          icon: Icons.shield_outlined,
          iconBgColor: Color.from(
            alpha: 0.11,
            red: 0,
            green: 0.463,
            blue: 0.714,
          ),
          iconColor: Color(0xFF0077b6),
          title: 'Secure & Trusted',
          subtitle: 'All providers are verified with proper credentials',
        ),
        _FeatureRow(
          icon: Icons.task_alt,
          iconBgColor: Color.from(
            alpha: 0.1,
            red: 0.941,
            green: 0.675,
            blue: 0.306,
          ),
          iconColor: Color(0xFFf0ad4e),
          title: 'Easy Booking Process',
          subtitle: 'Post your needs and receive bids from qualified providers',
        ),
      ],
    ),
  );
}

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String subtitle;

  const _FeatureRow({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Color(0xFF666666)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildActionButtons(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  return Padding(
    padding: const EdgeInsets.fromLTRB(32, 20, 32, 50),
    child: Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () => context.go('/auth/signup'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: WellthColors.gradientFrom,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            child: const Text('Get Started'),
          ),
        ),
        const SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: () => context.go('/auth/login'),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: colorScheme.primary, width: 1.5),
              foregroundColor: colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            child: const Text('Sign In'),
          ),
        ),
      ],
    ),
  );
}
