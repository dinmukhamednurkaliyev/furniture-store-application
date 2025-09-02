import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class SetUserUsecase {
  const SetUserUsecase(this._repository);

  final AuthenticationRepository _repository;

  Future<Result<UserEntity>> call({required UserEntity user}) =>
      _repository.setUser(user: user);
}
