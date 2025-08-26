import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

final applicationProvider = FutureProvider<bool>((ref) async {
  final getOnboardingStatus = ref.watch(getOnboardingStatusProvider);

  final result = await getOnboardingStatus();

  return switch (result) {
    Success(data: final hasSeen) => hasSeen,
    Error() => false,
  };
});
