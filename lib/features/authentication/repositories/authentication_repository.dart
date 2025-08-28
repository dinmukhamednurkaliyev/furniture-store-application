import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

abstract interface class AuthenticationRepository {
  Future<Result<bool>> getSignInStatus();
  Future<Result<void>> setSignInStatus({required bool status});
  Future<Result<UserEntity>> getUser();
  Future<Result<void>> setUser({required UserEntity user});
}

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._localDataSource);

  final AuthenticationLocalDataSource _localDataSource;

  @override
  Future<Result<bool>> getSignInStatus() async {
    try {
      final result = await _localDataSource.getSignInStatus();
      return Success(result);
    } on CacheException catch (e) {
      return Error(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Result<void>> setSignInStatus({required bool status}) async {
    try {
      await _localDataSource.setSignInStatus(status: status);
      return const Success(null);
    } on CacheException catch (e) {
      return Error(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Result<UserEntity>> getUser() async {
    try {
      final result = await _localDataSource.getUser();
      return Success(result);
    } on CacheException catch (e) {
      return Error(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Result<void>> setUser({required UserEntity user}) async {
    try {
      await _localDataSource.setUser(user: user);
      return const Success(null);
    } on CacheException catch (e) {
      return Error(CacheFailure(message: e.message));
    }
  }
}
