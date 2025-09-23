import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

final onboardingItemsProvider = FutureProvider<List<OnboardingItemEntity>>(
  (
    ref,
  ) async {
    final getOnboardingItems = await ref.watch(
      getOnboardingItemsUsecaseProvider.future,
    );
    final result = await getOnboardingItems();
    return result.when(
      success: (items) => items,
      error: (failure) => throw ApplicationException(message: failure.message),
    );
  },
);

final AsyncNotifierProvider<OnboardingNotifier, void>
onboardingActionNotifierProvider =
    AsyncNotifierProvider.autoDispose<OnboardingNotifier, void>(
      OnboardingNotifier.new,
    );
