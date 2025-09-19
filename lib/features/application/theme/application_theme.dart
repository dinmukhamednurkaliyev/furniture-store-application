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
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: 0,
          textStyle: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface.withValues(alpha: 0.6),
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        backgroundColor: colorScheme.surface,
        indicatorColor: Colors.transparent,
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: colorScheme.primary);
            }
            return IconThemeData(color: colorScheme.onSurfaceVariant);
          },
        ),
      ),
      extensions: const <ThemeExtension<dynamic>>[
        ApplicationPaddingTheme(),
        ApplicationRadiusTheme(),
        ApplicationSpacingTheme(),
      ],
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
      displayMedium: ApplicationTextTheme.displayMedium,
      displaySmall: ApplicationTextTheme.displaySmall,
      headlineLarge: ApplicationTextTheme.headlineLarge,
      headlineMedium: ApplicationTextTheme.headlineMedium,
      headlineSmall: ApplicationTextTheme.headlineSmall,
      titleLarge: ApplicationTextTheme.titleLarge,
      titleMedium: ApplicationTextTheme.titleMedium,
      titleSmall: ApplicationTextTheme.titleSmall,
      labelLarge: ApplicationTextTheme.labelLarge,
      labelMedium: ApplicationTextTheme.labelMedium,
      labelSmall: ApplicationTextTheme.labelSmall,
      bodyLarge: ApplicationTextTheme.bodyLarge,
      bodyMedium: ApplicationTextTheme.bodyMedium,
      bodySmall: ApplicationTextTheme.bodySmall,
    );
  }
}
