import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/primary_button.dart';
import '../controller/auth_providers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class LoginFormController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginFormController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoginFormController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_controller.formKey.currentState!.validate()) return;

    final authProvider = context.read<AuthProvider>();
    final success = await authProvider.login(
      email: _controller.emailController.text.trim(),
      password: _controller.passwordController.text.trim(),
    );

    if (!mounted) return;

    if (success) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.match);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(authProvider.errorMessage ?? 'Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final mobile = Responsive.isMobile(context);

    return Scaffold(
      body: _LoginScreenBody(
        mobile: mobile,
        authProvider: authProvider,
        controller: _controller,
        onLogin: _login,
      ),
    );
  }
}

class _LoginScreenBody extends StatelessWidget {
  const _LoginScreenBody({
    required this.mobile,
    required this.authProvider,
    required this.controller,
    required this.onLogin,
  });

  final bool mobile;
  final AuthProvider authProvider;
  final LoginFormController controller;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (mobile)
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1511632765486-a01980e01a18?auto=format&fit=crop&w=1200&q=80',
              fit: BoxFit.cover,
            ),
          ),
        if (mobile)
          Positioned.fill(
            child: ColoredBox(
              color: AppColors.deepRose.withValues(alpha: 0.48),
            ),
          ),
        SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.horizontalPadding(context),
                vertical: 20,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Container(
                  padding: EdgeInsets.all(mobile ? 20 : 28),
                  decoration: BoxDecoration(
                    color: mobile
                        ? Colors.white.withValues(alpha: 0.90)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(mobile ? 24 : 20),
                    border: Border.all(color: AppColors.outlineVariant),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x264A0E1C),
                        blurRadius: 24,
                        offset: Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        Text(
                          'Welcome\nBack...!!',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayMedium
                              ?.copyWith(
                                fontSize: mobile ? 34 : 40,
                                color: AppColors.charcoalInk,
                                height: 1.05,
                              ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Ready for your next surprise? ❤️',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontSize: mobile ? 15 : 16,
                                color: AppColors.onSurfaceVariant,
                              ),
                        ),
                        const SizedBox(height: 24),
                        if (authProvider.errorMessage != null) ...[
                          Text(
                            authProvider.errorMessage!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 14),
                        ],
                        AppTextField(
                          controller: controller.emailController,
                          label: 'Email',
                          hint: 'Enter your email',
                          icon: Icons.mail_outline,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                              ? 'Please enter your email'
                              : null,
                        ),
                        const SizedBox(height: 28),
                        AppTextField(
                          controller: controller.passwordController,
                          label: 'Password',
                          hint: 'Enter your password',
                          icon: Icons.lock_outline,
                          obscureText: true,
                          validator: (value) =>
                              value == null || value.trim().isEmpty
                              ? 'Please enter your password'
                              : null,
                        ),
                        const SizedBox(height: 12),
                        PrimaryButton(
                          text: authProvider.isLoading
                              ? 'Signing in...'
                              : 'Login',
                          icon: authProvider.isLoading
                              ? null
                              : Icons.arrow_forward,
                          pill: true,
                          onPressed: authProvider.isLoading ? null : onLogin,
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed(AppRoutes.signup),
                          child: Text(
                            'New here? Create an Account',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
