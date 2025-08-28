import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/application/application.dart';

enum ApplicationThemes {
  light(
    brightness: Brightness.light,
    palette: ApplicationPaletteTheme(
      seedColor: Color(0xFFFFB800),
      primaryColor: Color(0xFFFFB800),
      secondaryColor: Color(0xFF1A1A1A),
    ),
  ),

  dark(
    brightness: Brightness.dark,
    palette: ApplicationPaletteTheme(
      seedColor: Color(0xFFFFB800),
      primaryColor: Color(0xFFFFB800),
      secondaryColor: Color(0xFF1A1A1A),
    ),
  ),

  ocean(
    brightness: Brightness.dark,
    palette: ApplicationPaletteTheme(
      seedColor: Color(0xFF006994),
      primaryColor: Color(0xFF00A2D3),
      secondaryColor: Color(0xFF94E1F0),
    ),
  );

  const ApplicationThemes({
    required this.brightness,
    required this.palette,
  });

  final Brightness brightness;
  final ApplicationPaletteTheme palette;

  ThemeData get themeData => ApplicationTheme.createTheme(
    brightness: brightness,
    palette: palette,
  );
}
