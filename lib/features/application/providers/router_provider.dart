import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:furniture_store_application/features/blog/blog.dart';
import 'package:furniture_store_application/features/cart/cart.dart';
import 'package:furniture_store_application/features/home/home.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/profile/profile.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';
import 'package:furniture_store_application/features/wishlist/wishlist.dart';
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
