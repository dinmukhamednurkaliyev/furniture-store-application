import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

final onboardingNotifierProvider =
    NotifierProvider<OnboardingNotifier, OnboardingState>(
      OnboardingNotifier.new,
    );
