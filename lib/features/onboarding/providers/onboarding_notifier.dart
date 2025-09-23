import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

class OnboardingNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> setOnboardingStatus() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final setOnboardingStatusUsecase = await ref.read(
        setOnboardingStatusUsecaseProvider.future,
      );
      final result = await setOnboardingStatusUsecase();

      result.when(
        success: (_) {},
        error: (failure) => throw Exception(failure.toString()),
      );
    });
  }
}
