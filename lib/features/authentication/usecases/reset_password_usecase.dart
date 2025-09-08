import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class ResetPasswordUsecase {
  const ResetPasswordUsecase(this._repository);

  final AuthenticationRepository _repository;

  Future<Result<void>> call({required String email}) =>
      _repository.resetPassword(email: email);
}
