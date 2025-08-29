import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

final getOnboardingStatusUsecaseProvider =
    FutureProvider<GetOnboardingStatusUsecase>((ref) async {
      final repository = await ref.watch(onboardingRepositoryProvider.future);
      return GetOnboardingStatusUsecase(repository);
    });

final setOnboardingStatusUsecaseProvider =
    FutureProvider<SetOnboardingStatusUsecase>((ref) async {
      final repository = await ref.watch(onboardingRepositoryProvider.future);
      return SetOnboardingStatusUsecase(repository);
    });

final getOnboardingItemsUsecaseProvider =
    FutureProvider<GetOnboardingItemsUsecase>((ref) async {
      final repository = await ref.watch(onboardingRepositoryProvider.future);
      return GetOnboardingItemsUsecase(repository);
    });
