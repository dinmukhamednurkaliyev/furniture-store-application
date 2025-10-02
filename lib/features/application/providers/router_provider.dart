import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/features.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final initialization = ref.watch(initializationProvider);

  return GoRouter(
    initialLocation: SplashRoute.path,
    observers: [RouterObserver()],
    navigatorKey: _rootNavigatorKey,
    routes: [
      SplashRoute.route,
      OnboardingRoute.route,
      SignInRoute.route,
      SignUpRoute.route,
      ForgotPasswordRoute.route,
      ProductRoute.route,
      SpecialOffersRoute.route,
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavigationBarWidget(navigationShell: navigationShell);
        },
        branches: [
          HomeRoute.route,
          CartRoute.route,
          WishlistRoute.route,
          BlogRoute.route,
          ProfileRoute.route,
        ].map((route) => StatefulShellBranch(routes: [route])).toList(),
      ),
    ],

    redirect: (BuildContext context, GoRouterState state) {
      if (initialization.isLoading || initialization.hasError) {
        return SplashRoute.path;
      }

      final initialRoute = initialization.requireValue;
      final isGoingToSplash = state.matchedLocation == SplashRoute.path;

      if (isGoingToSplash) {
        switch (initialRoute) {
          case InitialRoute.onboarding:
            return OnboardingRoute.path;
          case InitialRoute.signIn:
            return SignInRoute.path;
          case InitialRoute.home:
            return HomeRoute.path;
        }
      }

      return null;
    },
  );
}
