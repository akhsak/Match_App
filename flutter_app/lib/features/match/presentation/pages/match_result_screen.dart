import 'package:flutter/material.dart';
import 'package:flutter_app/features/match/data/providers/match_provider.dart';
import 'package:provider/provider.dart';

import '../providers/match_provider.dart';

class MatchResultScreen extends StatelessWidget {
  const MatchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final result = context.watch<MatchProvider>().result;

    if (result == null) {
      return const Scaffold(
        body: Center(
          child: Text('No result available'),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '🔥 🔥 Find the Match Result... 🔥 🔥',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                Text(
                  result.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  result.isMatch
                      ? '❤️ ❤️ ❤️ ❤️ ❤️'
                      : '💔 💔',
                  style: const TextStyle(fontSize: 36),
                ),

                if (result.isMatch) ...[
                  const SizedBox(height: 20),
                  const Text(
                    'Made for Each Other...!!!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {
                    context.read<MatchProvider>().clearResult();

                    Navigator.pop(context);
                  },
                  child: const Text('Check Another Match'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}