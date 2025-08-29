import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/providers/shared_preferences_provider.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

// 1. Провайдер стал FutureProvider
final onboardingLocalDataSourceProvider =
    FutureProvider<OnboardingLocalDataSource>((ref) async {
  // 2. Мы дожидаемся загрузки SharedPreferences
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return OnboardingLocalDataSourceImplementation(prefs);
});

// 3. Этот провайдер тоже стал FutureProvider, так как зависит от предыдущего
final onboardingRepositoryProvider = FutureProvider<OnboardingRepository>((ref) async {
  final localDataSource =
      await ref.watch(onboardingLocalDataSourceProvider.future);
  return OnboardingRepositoryImplementation(localDataSource);
});