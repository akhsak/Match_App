import 'package:flutter/material.dart';

class AppGradients {
  const AppGradients._();

  static const LinearGradient primary = LinearGradient(
    colors: [Color(0xFFB93A4D), Color(0xFF7F1D1D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient card = LinearGradient(
    colors: [Color(0xFFF4D7E7), Color(0xFFE7D9FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient result = LinearGradient(
    colors: [Color(0xFF6B53D9), Color(0xFFB93A4D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
