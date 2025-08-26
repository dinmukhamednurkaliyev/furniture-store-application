import 'package:furniture_store_application/features/application/application.dart';
import 'package:go_router/go_router.dart';

final onboardingRoutes = [
  GoRoute(
    path: '/onboarding',
    name: 'onboarding',
    builder: (context, state) => const OnboardingPage(),
  ),
];

final splashRoutes = [
  GoRoute(
    path: '/splash',
    name: 'splash',
    builder: (context, state) => const SplashPage(),
  ),
];
