import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/setting/setting.dart';

final class SetOnboardingSeenUsecase {
  SetOnboardingSeenUsecase(this.repository);
  final SettingsRepository repository;

  Future<Result<void>> call() async {
    return repository.setHasSeenOnboarding();
  }
}
