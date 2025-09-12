import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/home/home.dart';
import 'package:go_router/go_router.dart';

class HomeRoute {
  static const String path = '/home';
  static const String name = 'home';

  static GoRoute get route => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => const HomePage(),
  );

  static void go(BuildContext context) {
    context.goNamed(name);
  }

  static void push(BuildContext context) {
    context.pushNamed(name);
  }
}
