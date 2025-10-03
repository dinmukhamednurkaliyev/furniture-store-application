import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding.g.dart';

@riverpod
class Onboarding extends _$Onboarding {
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
