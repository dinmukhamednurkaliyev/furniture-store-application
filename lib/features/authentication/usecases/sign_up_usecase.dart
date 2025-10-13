import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class SignUpUsecase {
  const SignUpUsecase(this._repository);
  final AuthenticationRepository _repository;

  Future<Result<UserEntity>> call({
    required String name,
    required String email,
    required String password,
  }) async {
    return Result.guardAsync(() async {
      final userToSave = UserEntity(email: email, name: name);
      final userResult = await _repository.setUser(user: userToSave);

      final savedUser = userResult.when(
        success: (user) => user,
        error: (failure) => throw Exception(failure.toString()),
      );

      await _repository.setSignInStatus(status: true);

      return savedUser;
    });
  }
}
