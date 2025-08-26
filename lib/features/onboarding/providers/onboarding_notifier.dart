import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

class OnboardingNotifier extends Notifier<void> {
  @override
  void build() {}

  Future<void> setOnboardingStatus() async {
    final setOnboardingStatus = ref.read(setOnboardingStatusProvider);
    await setOnboardingStatus();
  }
}
