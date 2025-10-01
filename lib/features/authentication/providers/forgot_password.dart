import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password.g.dart';

@riverpod
class ForgotPassword extends _$ForgotPassword {
  @override
  FutureOr<void> build() {}

  Future<void> resetPassword(String email) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final resetPasswordUsecase = await ref.read(
        resetPasswordUsecaseProvider.future,
      );
      final result = await resetPasswordUsecase(email: email);
      result.when(
        success: (_) {},
        error: (failure) => throw Exception(failure.toString()),
      );
    });
  }
}
