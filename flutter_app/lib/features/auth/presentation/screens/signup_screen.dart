import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../features/match/data/providers/auth_providers.dart';
import '../widgets/auth_field.dart';
import '../widgets/auth_form_container.dart';
import '../widgets/auth_layout.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    if (!_formKey.currentState!.validate()) return;

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    final authProvider = context.read<AuthProvider>();
    final success = await authProvider.signup(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      fullName:
          '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}'
              .trim(),
    );

    if (!mounted) return;

    if (success) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.match);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(authProvider.errorMessage ?? 'Signup failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: AuthLayout(
        rightPanel: AuthFormContainer(
          width: 520,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Create your profile',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1D1B20),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'A surprise match is waiting for you',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    Expanded(
                      child: AuthField(
                        controller: _firstNameController,
                        label: 'FIRST NAME',
                        hint: 'First name',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: AuthField(
                        controller: _lastNameController,
                        label: 'LAST NAME',
                        hint: 'Last name',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Enter last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                AuthField(
                  controller: _emailController,
                  label: 'EMAIL',
                  hint: 'your@email.com',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                AuthField(
                  controller: _passwordController,
                  label: 'PASSWORD',
                  hint: 'Min 8 characters',
                  obscure: true,
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                AuthField(
                  controller: _confirmPasswordController,
                  label: 'CONFIRM PASSWORD',
                  hint: '••••••',
                  obscure: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: authProvider.isLoading ? null : _signup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD63B4B),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: authProvider.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppRoutes.login),
                    child: const Text(
                      'Already have an account? Login',
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(
                        color: Color(0xFFD63B4B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
