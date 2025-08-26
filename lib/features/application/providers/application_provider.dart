import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

final applicationProvider = FutureProvider<bool>((ref) async {
  const minSplashDuration = Duration(milliseconds: 1500);

  final getOnboardingStatus = ref.watch(getOnboardingStatusProvider);

  final dataFuture = getOnboardingStatus();
  final timerFuture = Future<void>.delayed(minSplashDuration);

  await Future.wait([dataFuture, timerFuture]);

  final onboardingResult = await dataFuture;

  return switch (onboardingResult) {
    Success(data: final hasSeen) => hasSeen,
    Error() => false,
  };
});
