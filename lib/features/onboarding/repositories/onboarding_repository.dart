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
  Future<Result<bool>> getOnboardingStatus() async {
    try {
      final result = await _localDataSource.getOnboardingStatus();
      return Success(result);
    } on CacheException catch (e) {
      return Error(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Result<void>> setOnboardingStatus() async {
    try {
      await _localDataSource.setOnboardingStatus();
      return const Success(null);
    } on CacheException catch (e) {
      return Error(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Result<List<OnboardingItemEntity>>> getOnboardingItems() async {
    const items = [
      OnboardingItemEntity(
        title: 'Welcome to Furniture Store',
        description: 'Discover the best furniture for your home.',
        imagePath: 'assets/images/onboarding1.png',
      ),
      OnboardingItemEntity(
        title: 'Quality Products',
        description: 'We offer high-quality furniture at affordable prices.',
        imagePath: 'assets/images/onboarding2.png',
      ),
      OnboardingItemEntity(
        title: 'Easy Shopping',
        description:
            'Shop from the comfort of your home with our easy-to-use app.',
        imagePath: 'assets/images/onboarding3.png',
      ),
    ];
    return const Success(items);
  }
}
