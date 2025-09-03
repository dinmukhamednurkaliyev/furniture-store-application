import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

export 'onboarding_action_notifier.dart';

final AutoDisposeFutureProvider<List<OnboardingItemEntity>>
onboardingItemsProvider =
    FutureProvider.autoDispose<List<OnboardingItemEntity>>((ref) async {
      final getOnboardingItems = await ref.watch(
        getOnboardingItemsUsecaseProvider.future,
      );
      final result = await getOnboardingItems();
      return result.when(
        success: (items) => items,
        error: (failure) =>
            throw ApplicationException(message: failure.message),
      );
    });

final onboardingActionNotifierProvider =
    AutoDisposeNotifierProvider<OnboardingActionNotifier, AsyncValue<void>>(
      OnboardingActionNotifier.new,
    );
