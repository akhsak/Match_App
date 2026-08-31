import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_styles.dart';
import '../constants/ui_constants.dart';

/// The near-black panel that covers the card while a check is running.
///
/// The reference video uses this message as its only loading affordance, so
/// there is no spinner. [AnimatedOpacity] reproduces the short fade in the
/// recording.
class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({
    required this.visible,
    required this.message,
    super.key,
  });

  final bool visible;
  final String message;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !visible,
      child: AnimatedOpacity(
        opacity: visible ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: Semantics(
          liveRegion: true,
          label: visible ? message : null,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.overlayScrim.withValues(alpha: 0.95),
              borderRadius: BorderRadius.circular(UiConstants.cardRadius),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(UiConstants.spaceLg),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.overlayMessage,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}