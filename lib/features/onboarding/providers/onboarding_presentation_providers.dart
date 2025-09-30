import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_presentation_providers.g.dart';

@riverpod
Future<List<OnboardingItemEntity>> onboardingItems(
  Ref ref,
) async {
  final getOnboardingItems = await ref.watch(
    getOnboardingItemsUsecaseProvider.future,
  );
  final result = await getOnboardingItems();

  return result.when(
    success: (items) => items,
    error: (failure) => throw ApplicationException(message: failure.message),
  );
}
