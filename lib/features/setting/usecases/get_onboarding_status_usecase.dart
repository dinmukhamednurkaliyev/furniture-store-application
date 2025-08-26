import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/setting/setting.dart';

final class GetHasSeenOnboardingUsecase {
  GetHasSeenOnboardingUsecase(this._repository);
  final SettingsRepository _repository;

  Future<Result<bool>> call() async {
    return _repository.getHasSeenOnboarding();
  }
}
