import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authorization/authorization.dart';

final class GetAuthorizationStatus {
  GetAuthorizationStatus(this._repository);
  final AuthorizationRepository _repository;

  Future<Result<UserModel?>> call() async {
    return _repository.getAuthStatus();
  }
}
