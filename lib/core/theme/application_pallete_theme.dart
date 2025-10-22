import 'package:flutter/material.dart';

@immutable
final class ApplicationPaletteTheme {
  const ApplicationPaletteTheme({
    required this.seedColor,
    required this.primaryColor,
    required this.secondaryColor,
  });

  final Color seedColor;
  final Color primaryColor;
  final Color secondaryColor;
}
