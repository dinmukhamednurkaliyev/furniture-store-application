import 'package:furniture_store_application/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class OnboardingLocalDataSource {
  Future<bool> getOnboardingStatus();
  Future<void> setOnboardingStatus();
}

class OnboardingLocalDataSourceImplementation
    implements OnboardingLocalDataSource {
  const OnboardingLocalDataSourceImplementation(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  static const String _hasSeenOnboardingKey = 'hasSeenOnboarding';

  @override
  Future<bool> getOnboardingStatus() async {
    try {
      return _sharedPreferences.getBool(_hasSeenOnboardingKey) ?? false;
    } catch (e) {
      throw CacheException(message: 'Error getting onboarding status: $e');
    }
  }

  @override
  Future<void> setOnboardingStatus() async {
    try {
      await _sharedPreferences.setBool(_hasSeenOnboardingKey, true);
    } catch (e) {
      throw CacheException(message: 'Error setting onboarding status: $e');
    }
  }
}
