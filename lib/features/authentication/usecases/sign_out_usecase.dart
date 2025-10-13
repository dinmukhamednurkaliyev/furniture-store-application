import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class SignOutUsecase {
  const SignOutUsecase(this._repository);
  final AuthenticationRepository _repository;

  Future<Result<void>> call() async {
    return _repository.setSignInStatus(status: false);
  }
}
