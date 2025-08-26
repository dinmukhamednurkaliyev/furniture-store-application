import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

class GetOnboardingStatusUsecase {
  const GetOnboardingStatusUsecase(this._repository);
  final OnboardingRepository _repository;

  Future<Result<bool>> call() => _repository.getOnboardingStatus();
}
