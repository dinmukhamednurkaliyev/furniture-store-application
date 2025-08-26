import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/setting/setting.dart';

abstract class SettingsRepository {
  Future<Result<bool>> getHasSeenOnboarding();
  Future<Result<void>> setHasSeenOnboarding();
}

class SettingsRepositoryImplementation implements SettingsRepository {
  SettingsRepositoryImplementation({required this.localDataSource});
  final SettingsLocalDataSource localDataSource;

  @override
  Future<Result<bool>> getHasSeenOnboarding() async {
    try {
      final hasSeen = await localDataSource.getHasSeenOnboarding();
      return Success(hasSeen);
    } on CacheException {
      return Error(const CacheFailure());
    }
  }

  @override
  Future<Result<void>> setHasSeenOnboarding() async {
    try {
      await localDataSource.setHasSeenOnboarding();
      return Success(null);
    } on CacheException {
      return Error(const CacheFailure());
    }
  }
}
