import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:furniture_store_application/features/blog/blog.dart';
import 'package:furniture_store_application/features/cart/cart.dart';
import 'package:furniture_store_application/features/home/home.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';
import 'package:furniture_store_application/features/profile/profile.dart';
import 'package:furniture_store_application/features/wishlist/wishlist.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

enum ApplicationRoutes {
  splash(
    path: '/',
    name: 'splash',
  ),
  onboarding(
    path: '/onboarding',
    name: 'onboarding',
  ),
  home(
    path: '/home',
    name: 'home',
  ),
  cart(
    path: '/cart',
    name: 'cart',
  ),
  wishlist(
    path: '/wishlist',
    name: 'wishlist',
  ),
  blog(
    path: '/blog',
    name: 'blog',
  ),
  profile(
    path: '/profile',
    name: 'profile',
  ),
  signIn(
    path: '/sign-in',
    name: 'sign-in',
  ),
  signUp(
    path: '/sign-up',
    name: 'sign-up',
  ),
  forgotPassword(
    path: '/forgot-password',
    name: 'forgot-password',
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
        GoRoute(
          path: ApplicationRoutes.signIn.path,
          name: ApplicationRoutes.signIn.name,
          builder: (context, state) => const SignInPage(),
        ),
        GoRoute(
          path: ApplicationRoutes.signUp.path,
          name: ApplicationRoutes.signUp.name,
          builder: (context, state) => const SignUpPage(),
        ),
        GoRoute(
          path: ApplicationRoutes.forgotPassword.path,
          name: ApplicationRoutes.forgotPassword.name,
          builder: (context, state) => const ForgotPasswordPage(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return BottomNavigationBarWidget(
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ApplicationRoutes.home.path,
                  name: ApplicationRoutes.home.name,
                  builder: (context, state) => const HomePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ApplicationRoutes.cart.path,
                  name: ApplicationRoutes.cart.name,
                  builder: (context, state) => const CartPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ApplicationRoutes.wishlist.path,
                  name: ApplicationRoutes.wishlist.name,
                  builder: (context, state) => const WishlistPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ApplicationRoutes.blog.path,
                  name: ApplicationRoutes.blog.name,
                  builder: (context, state) => const BlogPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: ApplicationRoutes.profile.path,
                  name: ApplicationRoutes.profile.name,
                  builder: (context, state) => const ProfilePage(),
                ),
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
