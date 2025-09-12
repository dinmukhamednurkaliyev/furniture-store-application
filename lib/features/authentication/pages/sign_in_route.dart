import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:go_router/go_router.dart';

class SignInRoute {
  static const String path = '/sign-in';
  static const String name = 'sign-in';

  static GoRoute get route => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => const SignInPage(),
  );

  static void go(BuildContext context) {
    context.goNamed(name);
  }

  static void push(BuildContext context) {
    context.pushNamed(name);
  }
}
