import 'package:flutter/material.dart';
import 'package:flutter_app/features/match/data/providers/match_provider.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../providers/match_provider.dart';

class CheckMatchButton extends StatelessWidget {
  const CheckMatchButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final MatchProvider provider = context.watch<MatchProvider>();

    return AppButton(
      label: AppConstants.checkMatchButton,
      onPressed: onPressed,
      //enabled: provider.canSubmit,
      color: provider.isLoading ? AppColors.busy : AppColors.primary,
    );
  }
}

class NameInputField extends StatelessWidget {
  const NameInputField({
    required this.label,
    required this.controller,
    required this.validator,
    required this.onChanged,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
    this.enabled = true,
    super.key,
  });

  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onChanged;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final VoidCallback? onSubmitted;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(label, style: AppTextStyles.fieldLabel),
        const SizedBox(height: UiConstants.spaceSm),
        AppTextField(
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          focusNode: focusNode,
          textInputAction: textInputAction,
          onSubmitted: onSubmitted,
          enabled: enabled,
          semanticLabel: label,
        ),
      ],
    );
  }
}

class MatchHeader extends StatelessWidget {
  const MatchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Text(
        AppConstants.welcomeTitle,
        textAlign: TextAlign.center,
        style: AppTextStyles.welcomeTitle,
      ),
    );
  }
}