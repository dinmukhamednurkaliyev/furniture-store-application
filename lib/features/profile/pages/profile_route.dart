import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/profile/profile.dart';
import 'package:go_router/go_router.dart';

class ProfileRoute {
  static const String path = '/profile';
  static const String name = 'profile';

  static GoRoute get route => GoRoute(
        path: path,
        name: name,
        builder: (context, state) => const ProfilePage(),
      );

  static void go(BuildContext context) {
    context.goNamed(name);
  }

  static void push(BuildContext context) {
    context.pushNamed(name);
  }
}
