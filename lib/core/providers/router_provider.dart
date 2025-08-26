import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:furniture_store_application/features/authorization/routers/authorization_router.dart';
import 'package:furniture_store_application/features/home/home.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final applicationState = ref.watch(applicationStateNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final location = state.uri.path;

      return switch (applicationState) {
        ApplicationLoading() || ApplicationInitial() => '/splash',

        ApplicationReady(
          hasSeenOnboarding: final seen,
          isAuthenticated: final signedIn,
        ) =>
          switch ((seen, signedIn, location)) {
            (false, _, _) => '/onboarding',

            (true, false, final location) when location != '/sign_in' =>
              '/sign_in',
            (true, true, final location)
                when location == '/sign_in' ||
                    location == '/onboarding' ||
                    location == '/splash' =>
              '/home',

            _ => null,
          },
      };
    },

    routes: [
      ...splashRoutes,
      ...onboardingRoutes,
      ...authorizationRoutes,
      ...homeRoutes,
    ],
  );
});
