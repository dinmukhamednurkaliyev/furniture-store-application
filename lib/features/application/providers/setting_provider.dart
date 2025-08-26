import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/setting/setting.dart';

final settingsLocalDataSourceProvider = Provider<SettingsLocalDataSource>((
  ref,
) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).valueOrNull;
  if (sharedPreferences == null) {
    throw Exception('SharedPreferences not initialized');
  }
  return SettingsLocalDataSourceImplementation(
    sharedPreferences: sharedPreferences,
  );
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepositoryImplementation(
    localDataSource: ref.watch(settingsLocalDataSourceProvider),
  );
});

final getHasSeenOnboardingProvider = Provider<GetHasSeenOnboardingUsecase>((
  ref,
) {
  return GetHasSeenOnboardingUsecase(ref.watch(settingsRepositoryProvider));
});

final setOnboardingSeenProvider = Provider<SetOnboardingSeenUsecase>((ref) {
  return SetOnboardingSeenUsecase(ref.watch(settingsRepositoryProvider));
});
