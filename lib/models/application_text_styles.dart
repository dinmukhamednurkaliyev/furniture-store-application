import 'package:flutter/material.dart';
import 'package:furniture_store_application/models/models.dart';

@immutable
class ApplicationTextStyles {
  const ApplicationTextStyles._();

  static const String _fontFamily = 'Poppins';

  static const TextStyle headingStyle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ApplicationColors.textPrimary,
  );

  static const TextStyle titleStyle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ApplicationColors.textPrimary,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    color: ApplicationColors.textPrimary,
  );
}
