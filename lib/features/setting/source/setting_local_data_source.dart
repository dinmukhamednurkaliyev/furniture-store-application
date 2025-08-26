import 'package:furniture_store_application/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsLocalDataSource {
  Future<bool> getHasSeenOnboarding();
  Future<void> setHasSeenOnboarding();
}

const String _hasSeenOnboardingKey = 'has_seen_onboarding';

class SettingsLocalDataSourceImplementation implements SettingsLocalDataSource {
  SettingsLocalDataSourceImplementation({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Future<bool> getHasSeenOnboarding() async {
    try {
      return sharedPreferences.getBool(_hasSeenOnboardingKey) ?? false;
    } on Exception {
      throw CacheException();
    }
  }

  @override
  Future<void> setHasSeenOnboarding() async {
    try {
      final success = await sharedPreferences.setBool(
        _hasSeenOnboardingKey,
        true,
      );

      if (!success) {
        throw CacheException();
      }
    } on Exception {
      throw CacheException();
    }
  }
}
