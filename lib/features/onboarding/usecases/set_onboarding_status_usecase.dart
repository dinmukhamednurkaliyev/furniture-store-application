import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

class SetOnboardingStatusUsecase {
  const SetOnboardingStatusUsecase(this._repository);
  final OnboardingRepository _repository;

  Future<Result<void>> call() => _repository.setOnboardingStatus();
}
