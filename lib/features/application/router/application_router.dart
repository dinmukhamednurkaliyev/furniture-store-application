import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/application/pages/splash_route.dart';
import 'package:furniture_store_application/features/application/router/router_observer.dart';
import 'package:furniture_store_application/features/application/widgets/bottom_navigation_bar_widget.dart';
import 'package:furniture_store_application/features/authentication/pages/forgot_password_route.dart';
import 'package:furniture_store_application/features/authentication/pages/sign_in_route.dart';
import 'package:furniture_store_application/features/authentication/pages/sign_up_route.dart';
import 'package:furniture_store_application/features/blog/pages/blog_route.dart';
import 'package:furniture_store_application/features/cart/pages/cart_route.dart';
import 'package:furniture_store_application/features/home/pages/home_route.dart';
import 'package:furniture_store_application/features/onboarding/pages/onboarding_route.dart';
import 'package:furniture_store_application/features/profile/pages/profile_route.dart';
import 'package:furniture_store_application/features/wishlist/pages/wishlist_route.dart';
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
