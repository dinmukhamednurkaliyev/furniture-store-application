import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:furniture_store_application/features/authorization/authorization.dart';
import 'package:furniture_store_application/features/home/home.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final applicationState = ref.watch(applicationStateNotifierProvider);

  return GoRouter(
    initialLocation: ApplicationRoutes.splash,
    debugLogDiagnostics: true,

    redirect: (context, state) {
      final location = state.uri.path;

      return switch ((applicationState, location)) {
        // Состояние Загрузки
        (ApplicationInitial() || ApplicationLoading(), final loc)
            when loc != ApplicationRoutes.splash =>
          ApplicationRoutes.splash,

        (ApplicationError(), final loc) when loc != ApplicationRoutes.error =>
          ApplicationRoutes.error,

        (ApplicationReady(hasSeenOnboarding: false), final loc)
            when loc != ApplicationRoutes.onboarding =>
          ApplicationRoutes.onboarding,

        (
          ApplicationReady(hasSeenOnboarding: true, isAuthenticated: false),
          final loc,
        )
            when loc != ApplicationRoutes.signIn =>
          ApplicationRoutes.signIn,

        (ApplicationReady(isAuthenticated: true), final loc)
            when [
              ApplicationRoutes.splash,
              ApplicationRoutes.onboarding,
              ApplicationRoutes.signIn,
              ApplicationRoutes.error,
            ].contains(loc) =>
          ApplicationRoutes.home,

        _ => null,
      };
    },

    routes: [
      ...splashRoutes,
      ...errorRoutes,
      ...onboardingRoutes,
      ...signInRoutes,
      ...homeRoutes,
    ],
  );
});
