import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';
import 'package:go_router/go_router.dart';

class OnboardingRoute {
  static const String path = '/onboarding';
  static const String name = 'onboarding';

  static GoRoute get route => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => const OnboardingPage(),
  );

  static void go(BuildContext context) {
    context.goNamed(name);
  }

  static void push(BuildContext context) {
    context.pushNamed(name);
  }
}
