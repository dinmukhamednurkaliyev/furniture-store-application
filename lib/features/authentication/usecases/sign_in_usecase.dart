import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class SignInUsecase {
  const SignInUsecase(this._repository);
  final AuthenticationRepository _repository;

  Future<Result<UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return Result.guardAsync(() async {
      final userResult = await _repository.getUser();
      final user = userResult.when(
        success: (data) => data,
        error: (failure) => throw Exception(failure.toString()),
      );

      if (user.email != email) {
        throw Exception('Incorrect email or password.');
      }

      await _repository.setSignInStatus(status: true);

      return user;
    });
  }
}
