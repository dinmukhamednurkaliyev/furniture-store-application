import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class GetUserUsecase {
  const GetUserUsecase(this._repository);

  final AuthenticationRepository _repository;

  Future<Result<UserEntity>> call() => _repository.getUser();
}
