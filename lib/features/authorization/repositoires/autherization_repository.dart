import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authorization/authorization.dart';

abstract class AuthorizationRepository {
  Future<Result<UserEntity?>> getAuthorizationStatus();
}

class AuthorizationRepositoryImplementation implements AuthorizationRepository {
  AuthorizationRepositoryImplementation({
    required AuthorizationLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final AuthorizationLocalDataSource _localDataSource;

  @override
  Future<Result<UserEntity?>> getAuthorizationStatus() async {
    try {
      final currentSession = await _localDataSource.getSession();
      return Success(currentSession);
    } on CacheException {
      return Error(const CacheFailure(message: 'Failed to load session'));
    }
  }
}
