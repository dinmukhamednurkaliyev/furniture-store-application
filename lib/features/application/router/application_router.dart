import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/features.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@immutable
class ApplicationRouter {
  ApplicationRouter() : _router = _buildRouter();

  final GoRouter _router;

  GoRouter get router => _router;

  static GoRouter _buildRouter() {
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
            return BottomNavigationBarWidget(
              navigationShell: navigationShell,
            );
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
    );
  }
}
