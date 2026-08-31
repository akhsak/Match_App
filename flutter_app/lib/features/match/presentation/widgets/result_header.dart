import 'package:flutter/material.dart';

import '../../../../app/theme/app_text_styles.dart';
import '../../../../core/constants/app_constants.dart';

class ResultHeader extends StatelessWidget {
  const ResultHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Text(
        AppConstants.resultHeading,
        textAlign: TextAlign.center,
        style: AppTextStyles.resultHeading,
      ),
    );
  }
}
