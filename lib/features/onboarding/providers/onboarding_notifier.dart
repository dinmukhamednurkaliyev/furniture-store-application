import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

class OnboardingNotifier extends AutoDisposeNotifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  Future<void> setOnboardingStatus() async {
    state = const AsyncValue.loading();
    try {
      final setOnboardingStatusUsecase = await ref.read(
        setOnboardingStatusUsecaseProvider.future,
      );
      final result = await setOnboardingStatusUsecase();

      state = result.when(
        success: (_) => const AsyncValue.data(null),
        error: (failure) => AsyncValue.error(failure, StackTrace.current),
      );
    } on Exception catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
