import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class SetSignInStatusUsecase {
  const SetSignInStatusUsecase(this._repository);

  final AuthenticationRepository _repository;

  Future<Result<void>> call({required bool status}) =>
      _repository.setSignInStatus(status: status);
}
