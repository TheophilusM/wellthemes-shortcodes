// lib/features/auth/screens/forgot_password_screen.dart
import 'package:wellth/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/colors.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_button.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();

    final success = await ref
        .read(authControllerProvider.notifier)
        .forgotPassword(_emailController.text.trim());

    if (mounted) {
      if (success) {
        _showSuccessDialog();
      } else {
        final error = ref.read(authControllerProvider).error;
        _showError(error ?? 'Failed to send reset code');
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.errorRed,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Email Sent!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 64,
              color: AppColors.successGreen,
            ),
            const SizedBox(height: 16),
            Text(
              'We\'ve sent a password reset link to ${_emailController.text}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go('/auth/login');
            },
            child: const Text('Back to Login'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),

                // Icon
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock_reset,
                    size: 40,
                    color: AppColors.primaryBlue,
                  ),
                ),

                const SizedBox(height: 32),

                // Title
                Text('Forgot Password?', style: theme.textTheme.displayLarge),

                const SizedBox(height: 8),

                Text(
                  'Enter your email address and we\'ll send you a verification code to reset your password',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.mediumGrey,
                  ),
                ),

                const SizedBox(height: 32),

                // Email Field
                AuthTextField(
                  controller: _emailController,
                  label: 'Email Address',
                  hintText: 'your.email@example.com',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  validator: Validators.email,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _handleSubmit(),
                ),

                const SizedBox(height: 24),

                // Submit Button
                AuthButton(
                  onPressed: _handleSubmit,
                  text: 'Send Reset Code',
                  isLoading: authState.isLoading,
                ),

                const SizedBox(height: 16),

                // Back to Login
                AuthButton(
                  onPressed: () => context.pop(),
                  text: 'Back to Sign In',
                  isOutlined: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// lib/features/auth/screens/reset_password_screen.dart
class ResetPasswordScreen extends ConsumerStatefulWidget {
  final String token;

  const ResetPasswordScreen({super.key, required this.token});

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();

    final success = await ref
        .read(authControllerProvider.notifier)
        .resetPassword(
          token: widget.token,
          newPassword: _passwordController.text,
        );

    if (mounted) {
      if (success) {
        _showSuccessDialog();
      } else {
        final error = ref.read(authControllerProvider).error;
        _showError(error ?? 'Failed to reset password');
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.errorRed,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Password Reset Successful!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 64,
              color: AppColors.successGreen,
            ),
            const SizedBox(height: 16),
            const Text(
              'Your password has been reset successfully. You can now sign in with your new password.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go('/auth/login');
            },
            child: const Text('Go to Login'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),

                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.successGreen.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 40,
                    color: AppColors.successGreen,
                  ),
                ),

                const SizedBox(height: 32),

                Text('Reset Password', style: theme.textTheme.displayLarge),
                const SizedBox(height: 8),
                Text(
                  'Enter your new password',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.mediumGrey,
                  ),
                ),

                const SizedBox(height: 32),

                AuthTextField(
                  controller: _passwordController,
                  label: 'New Password',
                  hintText: '••••••••',
                  obscureText: _obscurePassword,
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.mediumGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  validator: Validators.password,
                  textInputAction: TextInputAction.next,
                ),

                const SizedBox(height: 8),

                Text(
                  'Minimum 8 characters',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.mediumGrey,
                  ),
                ),

                const SizedBox(height: 16),

                AuthTextField(
                  controller: _confirmPasswordController,
                  label: 'Confirm Password',
                  hintText: '••••••••',
                  obscureText: _obscureConfirmPassword,
                  prefixIcon: Icons.lock_outline,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.mediumGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                  validator: (value) => Validators.confirmPassword(
                    value,
                    _passwordController.text,
                  ),
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _handleSubmit(),
                ),

                const SizedBox(height: 24),

                AuthButton(
                  onPressed: _handleSubmit,
                  text: 'Reset Password',
                  isLoading: authState.isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// lib/features/auth/screens/mfa_screen.dart
class MfaScreen extends ConsumerStatefulWidget {
  const MfaScreen({super.key});

  @override
  ConsumerState<MfaScreen> createState() => _MfaScreenState();
}

class _MfaScreenState extends ConsumerState<MfaScreen> {
  final _codeController = TextEditingController();
  bool _rememberMe = true;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _handleVerify() async {
    if (_codeController.text.length != 6) {
      _showError('Please enter the 6-digit code');
      return;
    }

    await ref
        .read(authControllerProvider.notifier)
        .verifyMfa(code: _codeController.text, rememberMe: _rememberMe);

    if (mounted) {
      final authState = ref.read(authControllerProvider);

      if (authState.error != null) {
        _showError(authState.error!);
      } else if (authState.isAuthenticated) {
        context.go('/home');
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.errorRed,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.security,
                  size: 40,
                  color: AppColors.primaryBlue,
                ),
              ),

              const SizedBox(height: 32),

              Text(
                'Enter Verification Code',
                style: theme.textTheme.displayLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'We\'ve sent a 6-digit code to your email',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.mediumGrey,
                ),
              ),

              const SizedBox(height: 32),

              TextField(
                controller: _codeController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 6,
                style: theme.textTheme.displayLarge?.copyWith(letterSpacing: 8),
                decoration: InputDecoration(
                  hintText: '000000',
                  counterText: '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) {
                  if (value.length == 6) {
                    _handleVerify();
                  }
                },
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? true;
                      });
                    },
                  ),
                  Text(
                    'Remember this device',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              AuthButton(
                onPressed: _handleVerify,
                text: 'Verify',
                isLoading: authState.isLoading,
              ),

              const SizedBox(height: 16),

              TextButton(
                onPressed: () {
                  // Resend code logic
                },
                child: const Text('Resend Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// lib/features/auth/screens/verify_email_screen.dart
class VerifyEmailScreen extends ConsumerStatefulWidget {
  final String? token;

  const VerifyEmailScreen({super.key, this.token});

  @override
  ConsumerState<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends ConsumerState<VerifyEmailScreen> {
  bool _isVerifying = true;
  bool _isSuccess = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    if (widget.token != null) {
      _verifyEmail();
    }
  }

  Future<void> _verifyEmail() async {
    setState(() {
      _isVerifying = true;
    });

    final success = await ref
        .read(authControllerProvider.notifier)
        .verifyEmail(widget.token!);

    if (mounted) {
      setState(() {
        _isVerifying = false;
        _isSuccess = success;
        if (!success) {
          _errorMessage = ref.read(authControllerProvider).error;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isVerifying)
                Column(
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 24),
                    Text(
                      'Verifying your email...',
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                )
              else if (_isSuccess)
                Column(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 80,
                      color: AppColors.successGreen,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Email Verified!',
                      style: theme.textTheme.displayLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your email has been verified successfully',
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    AuthButton(
                      onPressed: () => context.go('/auth/login'),
                      text: 'Go to Login',
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 80,
                      color: AppColors.errorRed,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Verification Failed',
                      style: theme.textTheme.displayLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _errorMessage ?? 'Invalid or expired verification link',
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    AuthButton(
                      onPressed: () => context.go('/auth/login'),
                      text: 'Back to Login',
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
