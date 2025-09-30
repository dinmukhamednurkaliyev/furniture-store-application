import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_data_providers.g.dart';

@riverpod
Future<OnboardingLocalDataSource> onboardingLocalDataSource(
  Ref ref,
) async {
  final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
  return OnboardingLocalDataSourceImplementation(sharedPreferences);
}

@riverpod
Future<OnboardingRepository> onboardingRepository(
  Ref ref,
) async {
  final localDataSource = await ref.watch(
    onboardingLocalDataSourceProvider.future,
  );
  return OnboardingRepositoryImplementation(localDataSource);
}
