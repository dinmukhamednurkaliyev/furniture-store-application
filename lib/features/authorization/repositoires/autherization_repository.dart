import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authorization/authorization.dart';

abstract class AuthorizationRepository {
  Future<Result<UserModel?>> getAuthStatus();
}

class AuthRepositoryImplementation implements AuthorizationRepository {
  AuthRepositoryImplementation(this._localDataSource);
  final AuthorizationLocalDataSource _localDataSource;

  @override
  Future<Result<UserModel?>> getAuthStatus() async {
    try {
      final userModel = await _localDataSource.getSession();
      return Success(userModel);
    } on CacheException {
      return Error(const CacheFailure(message: 'Failed to load session'));
    }
  }
}
