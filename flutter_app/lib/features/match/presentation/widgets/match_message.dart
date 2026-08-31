import 'package:flutter/material.dart';

import '../../../../app/theme/app_text_styles.dart';
import '../../domain/entities/match_result.dart';

class MatchMessage extends StatelessWidget {
  const MatchMessage({required this.result, super.key});

  final MatchResult result;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: result.headline,
      excludeSemantics: true,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: AppTextStyles.resultHeadline,
            children: <InlineSpan>[
              TextSpan(
                text: result.displayGirlName,
                style: AppTextStyles.resultName,
              ),
              const TextSpan(text: ' and '),
              TextSpan(
                text: result.displayBoyName,
                style: AppTextStyles.resultName,
              ),
              TextSpan(text: ' ${result.verdict}'),
            ],
          ),
        ),
      ),
    );
  }
}
