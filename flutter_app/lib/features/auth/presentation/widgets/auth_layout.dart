import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    this.leftPanel,
    this.rightPanel,
    super.key,
  }) : assert(
          leftPanel != null || rightPanel != null,
          'Provide at least one panel to AuthLayout.',
        );

  final Widget? leftPanel;
  final Widget? rightPanel;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 720;

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (leftPanel != null) Expanded(child: leftPanel!),
                      if (leftPanel != null && rightPanel != null)
                        const SizedBox(width: 20),
                      if (rightPanel != null) Expanded(child: rightPanel!),
                    ],
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        if (leftPanel != null) leftPanel!,
                        if (leftPanel != null && rightPanel != null)
                          const SizedBox(height: 12),
                        if (rightPanel != null) rightPanel!,
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
