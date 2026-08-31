import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../constants/ui_constants.dart';

/// The single button used across both screens.
///
/// The reference video's buttons differ only in fill colour, so one widget
/// with a [color] parameter covers all three states (indigo idle, dark red
/// while busy, green on the result screen) without duplicating shape, padding
/// or typography.
class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.color = AppColors.primary,
    this.enabled = true,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final Color color;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        disabledBackgroundColor: color.withValues(alpha: 0.55),
        disabledForegroundColor: AppColors.onDark.withValues(alpha: 0.75),
        foregroundColor: AppColors.onDark,
        minimumSize: const Size(0, UiConstants.minTapTarget),
      ),
      child: Text(label, style: AppTextStyles.button),
    );
  }
}