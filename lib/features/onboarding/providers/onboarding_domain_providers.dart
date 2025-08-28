import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

final getOnboardingStatusUsecaseProvider = Provider<GetOnboardingStatusUsecase>(
  (ref) => GetOnboardingStatusUsecase(ref.watch(onboardingRepositoryProvider)),
);

final setOnboardingStatusUsecaseProvider = Provider<SetOnboardingStatusUsecase>(
  (ref) => SetOnboardingStatusUsecase(ref.watch(onboardingRepositoryProvider)),
);

final getOnboardingItemsUsecaseProvider = Provider<GetOnboardingItems>(
  (ref) => GetOnboardingItems(ref.watch(onboardingRepositoryProvider)),
);
