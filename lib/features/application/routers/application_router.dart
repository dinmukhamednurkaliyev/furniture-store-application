import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:go_router/go_router.dart';

final onboardingRoutes = [
  GoRoute(
    path: ApplicationRoutes.onboarding,
    name: 'onboarding',
    pageBuilder: (context, state) {
      return FadeTransitionPage(
        key: state.pageKey,
        child: const OnboardingPage(),
      );
    },
  ),
];

final splashRoutes = [
  GoRoute(
    path: ApplicationRoutes.splash,
    name: 'splash',
    builder: (context, state) {
      return const SplashPage();
    },
  ),
];

final errorRoutes = [
  GoRoute(
    path: ApplicationRoutes.error,
    name: 'error',
    builder: (context, state) {
      return const ErrorPage(
        errorMessage: 'Something went wrong',
      );
    },
  ),
];
