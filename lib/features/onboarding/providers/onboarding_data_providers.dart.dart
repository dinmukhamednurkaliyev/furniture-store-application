import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/providers/shared_preferences_provider.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

final onboardingLocalDataSourceProvider =
    FutureProvider<OnboardingLocalDataSource>((ref) async {
      final sharedPreferences = await ref.watch(
        sharedPreferencesProvider.future,
      );
      return OnboardingLocalDataSourceImplementation(sharedPreferences);
    });

final onboardingRepositoryProvider = FutureProvider<OnboardingRepository>((
  ref,
) async {
  final localDataSource = await ref.watch(
    onboardingLocalDataSourceProvider.future,
  );
  return OnboardingRepositoryImplementation(localDataSource);
});
