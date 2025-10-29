import 'package:application_core/application_core.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

abstract interface class OnboardingRepository {
  Future<Result<bool>> getOnboardingStatus();

  Future<Result<void>> setOnboardingStatus();

  Future<Result<List<OnboardingItemEntity>>> getOnboardingItems();
}

class OnboardingRepositoryImplementation implements OnboardingRepository {
  const OnboardingRepositoryImplementation(this._localDataSource);
  final OnboardingLocalDataSource _localDataSource;

  @override
  Future<Result<bool>> getOnboardingStatus() =>
      Result.guardAsync(_localDataSource.getOnboardingStatus);

  @override
  Future<Result<void>> setOnboardingStatus() =>
      Result.guardAsync(_localDataSource.setOnboardingStatus);

  @override
  Future<Result<List<OnboardingItemEntity>>> getOnboardingItems() async {
    final items = [
      OnboardingItemEntity(
        title: 'Welcome to Furniture Store',
        description: 'Discover the best furniture for your home.',
        image: ImageEntity.local(
          ApplicationCore.assets.images.onboarding1.path,
        ),
      ),
      OnboardingItemEntity(
        title: 'Quality Products',
        description: 'We offer high-quality furniture at affordable prices.',
        image: ImageEntity.local(
          ApplicationCore.assets.images.onboarding2.path,
        ),
      ),
      OnboardingItemEntity(
        title: 'Easy Shopping',
        description:
            'Shop from the comfort of your home with our easy-to-use app.',
        image: ImageEntity.local(
          ApplicationCore.assets.images.onboarding3.path,
        ),
      ),
    ];
    return Result.success(items);
  }
}
