import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
abstract final class ApplicationTheme {
  static ThemeData createTheme({
    required Brightness brightness,
    required ApplicationPaletteTheme palette,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: palette.seedColor,
      primary: palette.primaryColor,
      secondary: palette.secondaryColor,
      brightness: brightness,
    );

    final textTheme = _createTextTheme(colorScheme: colorScheme);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF1A1A1A)),
      ),
    );
  }

  static TextTheme _createTextTheme({required ColorScheme colorScheme}) {
    final baseGoogleFontsTheme = GoogleFonts.poppinsTextTheme();

    final baseTextTheme = baseGoogleFontsTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    return baseTextTheme.copyWith(
      displayLarge: ApplicationTextTheme.displayLarge,
      titleLarge: ApplicationTextTheme.titleLarge,
      bodyLarge: ApplicationTextTheme.bodyLarge,
      bodyMedium: ApplicationTextTheme.bodyMedium,
    );
  }
}
