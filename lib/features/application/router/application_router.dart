import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/application/pages/splash_page.dart';
import 'package:furniture_store_application/features/home/pages/home_page.dart';
import 'package:furniture_store_application/features/onboarding/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

enum ApplicationRoutes {
  splash(
    path: '/',
    name: 'splash',
    page: SplashPage(),
  ),
  onboarding(
    path: '/onboarding',
    name: 'onboarding',
    page: OnboardingPage(),
  ),
  home(
    path: '/home',
    name: 'home',
    page: HomePage(),
  );

  const ApplicationRoutes({
    required this.path,
    required this.name,
    required this.page,
  });

  final String path;

  final String name;

  final Widget page;
}

class ApplicationRouter {
  ApplicationRouter() : _router = _buildRouter();

  final GoRouter _router;

  GoRouter get router => _router;

  static GoRouter _buildRouter() {
    return GoRouter(
      initialLocation: ApplicationRoutes.splash.path,
      routes: ApplicationRoutes.values.map((route) {
        return GoRoute(
          path: route.path,
          name: route.path == '/' ? null : route.name,
          builder: (BuildContext context, GoRouterState state) => route.page,
        );
      }).toList(),
    );
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  return ApplicationRouter().router;
});
