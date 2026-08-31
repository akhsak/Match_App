import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/app_button.dart';

class AnotherMatchButton extends StatelessWidget {
  const AnotherMatchButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: AppConstants.checkAnotherButton,
      onPressed: onPressed,
      color: AppColors.success,
    );
  }
}
