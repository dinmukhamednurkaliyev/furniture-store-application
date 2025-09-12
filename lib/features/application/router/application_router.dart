import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:furniture_store_application/features/authentication/pages/forgot_password_route.dart';
import 'package:furniture_store_application/features/authentication/pages/sign_in_route.dart';
import 'package:furniture_store_application/features/authentication/pages/sign_up_route.dart';
import 'package:furniture_store_application/features/blog/pages/blog_route.dart';
import 'package:furniture_store_application/features/cart/pages/cart_route.dart';
import 'package:furniture_store_application/features/home/pages/home_route.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';
import 'package:furniture_store_application/features/profile/pages/profile_route.dart';
import 'package:furniture_store_application/features/wishlist/pages/wishlist_route.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

// The enum is now redundant, but we will keep it for now
// to avoid breaking other parts of the code. A full refactor would
// remove this enum entirely.
enum ApplicationRoutes {
  splash(
    path: '/',
    name: 'splash',
  ),
  onboarding(
    path: '/onboarding',
    name: 'onboarding',
  );

  const ApplicationRoutes({
    required this.path,
    required this.name,
  });

  final String path;

  final String name;
}

@immutable
class ApplicationRouter {
  ApplicationRouter() : _router = _buildRouter();

  final GoRouter _router;

  GoRouter get router => _router;

  static GoRouter _buildRouter() {
    return GoRouter(
      initialLocation: ApplicationRoutes.splash.path,
      observers: [RouterObserver()],
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          path: ApplicationRoutes.splash.path,
          name: ApplicationRoutes.splash.name,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: ApplicationRoutes.onboarding.path,
          name: ApplicationRoutes.onboarding.name,
          builder: (context, state) => const OnboardingPage(),
        ),
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
            StatefulShellBranch(
              routes: [
                HomeRoute.route,
              ],
            ),
            StatefulShellBranch(
              routes: [
                CartRoute.route,
              ],
            ),
            StatefulShellBranch(
              routes: [
                WishlistRoute.route,
              ],
            ),
            StatefulShellBranch(
              routes: [
                BlogRoute.route,
              ],
            ),
            StatefulShellBranch(
              routes: [
                ProfileRoute.route,
              ],
            ),
          ],
        ),
      ],
    );
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  return ApplicationRouter().router;
});
