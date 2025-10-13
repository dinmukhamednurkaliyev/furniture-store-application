import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeModeSelection extends _$ThemeModeSelection {
  static const String _themeModeKey = 'themeMode';

  @override
  Future<ThemeMode> build() async {
    final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
    final savedThemeMode = sharedPreferences.getString(_themeModeKey);
    if (savedThemeMode != null) {
      return ThemeMode.values.firstWhere(
        (mode) => mode.toString() == savedThemeMode,
        orElse: () => ThemeMode.system,
      );
    }
    return ThemeMode.system;
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    state = AsyncValue.data(themeMode);
    final sharedPreferences = await ref.read(sharedPreferencesProvider.future);
    await sharedPreferences.setString(_themeModeKey, themeMode.toString());
  }
}
