import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_notifier.g.dart';

@riverpod
class ForgotPasswordNotifier extends _$ForgotPasswordNotifier {
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
