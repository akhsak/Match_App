import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';

class MatchEmojiDisplay extends StatelessWidget {
  const MatchEmojiDisplay({
    required this.count,
    required this.isMatch,
    super.key,
  });

  final int count;
  final bool isMatch;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: isMatch ? '$count hearts' : '$count broken hearts',
      excludeSemantics: true,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: UiConstants.spaceSm,
        runSpacing: UiConstants.spaceXs,
        children: List<Widget>.generate(
          count,
          (_) => Icon(
            isMatch ? Icons.favorite : Icons.heart_broken,
            color: AppColors.heart,
            size: UiConstants.heartIconSize,
          ),
        ),
      ),
    );
  }
}
