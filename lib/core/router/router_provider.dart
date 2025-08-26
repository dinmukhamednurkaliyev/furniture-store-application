import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:furniture_store_application/features/authorization/authorization.dart';
import 'package:furniture_store_application/features/home/home.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final appState = ref.watch(applicationStateNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true,

    redirect: (context, state) {
      final location = state.uri.path;

      return switch ((appState, location)) {
        (ApplicationInitial() || ApplicationLoading(), final loc)
            when loc != '/splash' =>
          '/splash',

        (ApplicationError(), final loc) when loc != '/error' => '/error',

        (ApplicationReady(hasSeenOnboarding: false), final loc)
            when loc != '/onboarding' =>
          '/onboarding',

        (
          ApplicationReady(hasSeenOnboarding: true, isAuthenticated: false),
          final loc,
        )
            when loc != '/sign_in' =>
          '/sign_in',

        (ApplicationReady(isAuthenticated: true), final loc)
            when [
              '/splash',
              '/onboarding',
              '/sign_in',
              '/error',
            ].contains(loc) =>
          '/home',
        _ => null,
      };
    },

    routes: [
      ...splashRoutes,
      ...onboardingRoutes,
      ...signInRoutes,
      ...homeRoutes,
      GoRoute(
        path: '/error',
        name: 'error',
        builder: (context, state) {
          final message = (appState is ApplicationError)
              ? appState.message
              : 'An unknown error occurred';
          return Scaffold(body: Center(child: Text(message)));
        },
      ),
    ],
  );
});
