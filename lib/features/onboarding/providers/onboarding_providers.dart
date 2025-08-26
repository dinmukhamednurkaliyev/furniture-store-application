import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/utilities/result.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

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
