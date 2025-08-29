import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

class GetOnboardingItemsUsecase {
  const GetOnboardingItemsUsecase(this._repository);
  final OnboardingRepository _repository;

  Future<Result<List<OnboardingItemEntity>>> call() =>
      _repository.getOnboardingItems();
}
