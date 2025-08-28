import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class GetSignInStatusUsecase {
  const GetSignInStatusUsecase(this._repository);
  final AuthenticationRepository _repository;

  Future<Result<bool>> call() => _repository.getSignInStatus();
}
