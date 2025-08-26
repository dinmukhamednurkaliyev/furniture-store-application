import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = FutureProvider<SharedPreferences>(
  (ref) => SharedPreferences.getInstance(),
);

final onboardingLocalDataSourceProvider = Provider<OnboardingLocalDataSource>(
  (ref) {
    final prefs = ref.watch(sharedPreferencesProvider).value!;
    return OnboardingLocalDataSourceImplementation(prefs);
  },
);

final onboardingRepositoryProvider = Provider<OnboardingRepository>(
  (ref) => OnboardingRepositoryImplementation(
    ref.watch(onboardingLocalDataSourceProvider),
  ),
);
