import 'package:flutter/material.dart';

@immutable
class ApplicationColors {
  const ApplicationColors._();

  static const Color primary = Color(0xFFFFB800);
  static const Color secondary = Color(0xFF1A1A1A);

  static const Color textPrimary = Color(
    0xFF1A1A1A,
  );
  static const Color textSecondary = Color(
    0xFF8A8A8A,
  );
  static const Color textOnPrimary = Colors.white;

  static const Color background = Colors.white;
  static const Color backgroundLight = Color(
    0xFFF5F5F5,
  );

  static const Color error = Colors.red;
  static const Color success = Colors.green;
}
