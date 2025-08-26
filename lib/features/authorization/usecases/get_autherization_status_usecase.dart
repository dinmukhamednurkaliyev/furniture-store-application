import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authorization/authorization.dart';

final class GetAuthorizationStatusUsecase {
  GetAuthorizationStatusUsecase(this._repository);
  final AuthorizationRepository _repository;

  Future<Result<UserEntity?>> call() async {
    return _repository.getAuthStatus();
  }
}
