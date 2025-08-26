import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:furniture_store_application/features/home/home.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';
import 'package:go_router/go_router.dart';

class ApplicationRoutes {
  ApplicationRoutes._();

  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
}

final routerProvider = Provider<GoRouter>((ref) {
  final applicationState = ref.watch(applicationProvider);

  return GoRouter(
    initialLocation: ApplicationRoutes.splash,
    refreshListenable: _GoRouterRefreshStream(applicationState),

    routes: [
      GoRoute(
        path: ApplicationRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: ApplicationRoutes.onboarding,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OnboardingPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: ApplicationRoutes.home,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
    ],

    redirect: (BuildContext context, GoRouterState state) {
      final currentLocation = state.matchedLocation;

      return switch (applicationState) {
        AsyncData(value: final hasSeenOnboarding) => () {
          final isGoingToSplash = currentLocation == ApplicationRoutes.splash;
          final isGoingToOnboarding =
              currentLocation == ApplicationRoutes.onboarding;

          if (hasSeenOnboarding) {
            return isGoingToSplash || isGoingToOnboarding
                ? ApplicationRoutes.home
                : null;
          } else {
            return isGoingToOnboarding ? null : ApplicationRoutes.onboarding;
          }
        }(),

        _ => ApplicationRoutes.splash,
      };
    },
  );
});

class _GoRouterRefreshStream extends ChangeNotifier {
  _GoRouterRefreshStream(AsyncValue<dynamic> stream) {
    stream.whenOrNull(
      data: (_) => notifyListeners(),
      error: (_, _) => notifyListeners(),
    );
  }
}
