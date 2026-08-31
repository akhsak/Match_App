import 'package:flutter/material.dart';

import '../../../../app/theme/app_text_styles.dart';

class MatchTagline extends StatelessWidget {
  const MatchTagline({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) return const SizedBox.shrink();

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyles.resultTagline,
      ),
    );
  }
}
