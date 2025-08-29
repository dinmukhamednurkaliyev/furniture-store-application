import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

final AutoDisposeNotifierProvider<OnboardingNotifier, OnboardingState>
onboardingNotifierProvider =
    NotifierProvider.autoDispose<OnboardingNotifier, OnboardingState>(
      OnboardingNotifier.new,
    );
