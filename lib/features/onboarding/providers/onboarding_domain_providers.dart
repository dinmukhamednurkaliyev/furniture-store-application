import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

final getOnboardingStatusProvider = Provider<GetOnboardingStatusUsecase>(
  (ref) => GetOnboardingStatusUsecase(ref.watch(onboardingRepositoryProvider)),
);

final setOnboardingStatusProvider = Provider<SetOnboardingStatusUsecase>(
  (ref) => SetOnboardingStatusUsecase(ref.watch(onboardingRepositoryProvider)),
);

final getOnboardingItemsProvider = Provider<GetOnboardingItems>(
  (ref) => GetOnboardingItems(ref.watch(onboardingRepositoryProvider)),
);
