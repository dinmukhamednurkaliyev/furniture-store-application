import 'package:furniture_store_application/features/onboarding/onboarding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_use_case_provider.g.dart';

@riverpod
Future<GetOnboardingStatusUsecase> getOnboardingStatusUsecase(
  Ref ref,
) async {
  final repository = await ref.watch(onboardingRepositoryProvider.future);
  return GetOnboardingStatusUsecase(repository);
}

@riverpod
Future<SetOnboardingStatusUsecase> setOnboardingStatusUsecase(
  Ref ref,
) async {
  final repository = await ref.watch(onboardingRepositoryProvider.future);
  return SetOnboardingStatusUsecase(repository);
}

@riverpod
Future<GetOnboardingItemsUsecase> getOnboardingItemsUsecase(
  Ref ref,
) async {
  final repository = await ref.watch(onboardingRepositoryProvider.future);
  return GetOnboardingItemsUsecase(repository);
}
