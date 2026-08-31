import 'package:flutter/material.dart';
import 'package:flutter_app/features/match/data/providers/match_provider.dart';
import 'package:provider/provider.dart';

import '../providers/match_provider.dart';
import 'match_result_screen.dart';

class MatchInputScreen extends StatefulWidget {
  const MatchInputScreen({super.key});

  @override
  State<MatchInputScreen> createState() => _MatchInputScreenState();
}

class _MatchInputScreenState extends State<MatchInputScreen> {
  final _formKey = GlobalKey<FormState>();

  final _boyController = TextEditingController();
  final _girlController = TextEditingController();

  @override
  void dispose() {
    _boyController.dispose();
    _girlController.dispose();
    super.dispose();
  }

  Future<void> _checkMatch() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final provider = context.read<MatchProvider>();
    final controller = MatchController(provider);

    final success = await controller.submitMatch(
      boyName: _boyController.text,
      girlName: _girlController.text,
    );

    if (!mounted) return;

    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const MatchResultScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            provider.errorMessage ?? 'Something went wrong',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<MatchProvider>(
          builder: (context, provider, _) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to Match.Com Surprise App...!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 32),

                    TextFormField(
                      controller: _girlController,
                      decoration: const InputDecoration(
                        labelText: 'Girl Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter girl name';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _boyController,
                      decoration: const InputDecoration(
                        labelText: 'Boy Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter boy name';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:
                            provider.isLoading ? null : _checkMatch,
                        child: provider.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(),
                              )
                            : const Text('Check Match'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}