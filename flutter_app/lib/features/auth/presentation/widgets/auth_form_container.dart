import 'package:flutter/material.dart';

class AuthFormContainer extends StatelessWidget {
  const AuthFormContainer({required this.child, this.width, super.key});

  final Widget child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F3F3),
      padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 30),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width ?? 420),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: child,
          ),
        ),
      ),
    );
  }
}
