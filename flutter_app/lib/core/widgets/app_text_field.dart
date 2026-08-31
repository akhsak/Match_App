import 'package:flutter/material.dart';

import '../../app/theme/app_text_styles.dart';
import '../constants/ui_constants.dart';
import '../utils/validators.dart';

/// White, rounded, centred text field matching the reference video.
///
/// Owns no controller of its own: the parent screen creates and disposes them,
/// which keeps the lifecycle in one place.
class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.controller,
    required this.validator,
    required this.onChanged,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
    this.enabled = true,
    this.semanticLabel,
    super.key,
  });

  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onChanged;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final VoidCallback? onSubmitted;
  final bool enabled;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: UiConstants.maxFieldWidth),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        enabled: enabled,
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: (_) => onSubmitted?.call(),
        textInputAction: textInputAction,
        textCapitalization: TextCapitalization.words,
        keyboardType: TextInputType.name,
        autocorrect: false,
        maxLength: Validators.maxNameLength,
        style: AppTextStyles.fieldInput,
        decoration: InputDecoration(
          counterText: '',
          hintText: semanticLabel,
          hintStyle: AppTextStyles.fieldInput.copyWith(
            color: Colors.black.withValues(alpha: 0.35),
          ),
        ),
      ),
    );
  }
}