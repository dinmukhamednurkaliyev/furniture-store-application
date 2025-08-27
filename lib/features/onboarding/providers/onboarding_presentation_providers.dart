import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

final onboardingStatusProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(onboardingRepositoryProvider);
  final result = await repository.getOnboardingStatus();
  return switch (result) {
    Success(data: final hasSeenOnboarding) => hasSeenOnboarding,
    Error() => false,
  };
});

final FutureProvider<Result<List<OnboardingItemEntity>>>
onboardingItemsFutureProvider = FutureProvider(
  (ref) {
    final getOnboardingItems = ref.watch(getOnboardingItemsProvider);
    return getOnboardingItems();
  },
);

final onboardingNotifierProvider = NotifierProvider<OnboardingNotifier, void>(
  OnboardingNotifier.new,
);
