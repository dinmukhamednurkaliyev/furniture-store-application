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
    return _sharedPreferences.getBool(_hasSeenOnboardingKey) ?? false;
  }

  @override
  Future<void> setOnboardingStatus() async {
    await _sharedPreferences.setBool(_hasSeenOnboardingKey, true);
  }
}
