import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/setting/setting.dart';

final settingsLocalDataSourceProvider = Provider<SettingsLocalDataSource>((
  ref,
) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).valueOrNull;

  if (sharedPreferences == null) {
    throw Exception('SharedPreferences not initialized yet');
  }

  return SettingsLocalDataSourceImplementation(
    sharedPreferences: sharedPreferences,
  );
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  final localDataSource = ref.watch(settingsLocalDataSourceProvider);

  return SettingsRepositoryImplementation(localDataSource: localDataSource);
});

final getHasSeenOnboardingProvider = Provider<GetHasSeenOnboardingUsecase>((
  ref,
) {
  final repository = ref.watch(settingsRepositoryProvider);

  return GetHasSeenOnboardingUsecase(repository);
});

final setOnboardingSeenProvider = Provider<SetOnboardingSeenUsecase>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);

  return SetOnboardingSeenUsecase(repository);
});
