import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

class OnboardingNotifier extends AutoDisposeNotifier<OnboardingState> {
  @override
  OnboardingState build() {
    return const OnboardingState();
  }

  Future<void> initialize() async {
    state = state.copyWith(isDataLoading: true);

    final getOnboardingItems = await ref.read(
      getOnboardingItemsUsecaseProvider.future,
    );
    final result = await getOnboardingItems();

    result.when(
      success: (items) {
        state = state.copyWith(isDataLoading: false, items: items);
      },
      error: (failure) {
        state = state.copyWith(
          isDataLoading: false,
          errorMessage: failure.message,
        );
      },
    );
  }

  Future<void> setOnboardingStatus() async {
    state = state.copyWith(isActionLoading: true);

    final setOnboardingStatus = await ref.read(
      setOnboardingStatusUsecaseProvider.future,
    );
    final result = await setOnboardingStatus();

    result.when(
      success: (_) {
        state = state.copyWith(isActionLoading: false);
      },
      error: (failure) {
        state = state.copyWith(
          isActionLoading: false,
          errorMessage: failure.message,
        );
      },
    );
  }
}
