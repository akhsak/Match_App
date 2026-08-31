import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppLogo extends StatelessWidget {
  final bool centered;

  const AppLogo({super.key, this.centered = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: centered
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        const Icon(Icons.favorite, color: AppColors.matchRed, size: 30),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            'Match.Com\nSurprise',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppColors.matchRed,
              fontSize: 36,
              height: 1.05,
            ),
          ),
        ),
      ],
    );
  }
}
