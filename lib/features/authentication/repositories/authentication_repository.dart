import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

abstract interface class AuthenticationRepository {
  Future<Result<bool>> getSignInStatus();
  Future<Result<void>> setSignInStatus({required bool status});
  Future<Result<UserEntity>> getUser();
  Future<Result<UserEntity>> setUser({required UserEntity user});
}

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._localDataSource);

  final AuthenticationLocalDataSource _localDataSource;

  @override
  Future<Result<bool>> getSignInStatus() =>
      Result.guardAsync(_localDataSource.getSignInStatus);

  @override
  Future<Result<void>> setSignInStatus({required bool status}) =>
      Result.guardAsync(() => _localDataSource.setSignInStatus(status: status));

  @override
  Future<Result<UserEntity>> getUser() =>
      Result.guardAsync(_localDataSource.getUser);

  @override
  Future<Result<UserEntity>> setUser({required UserEntity user}) =>
      Result.guardAsync(() => _localDataSource.setUser(user: user));
}
