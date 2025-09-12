import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordRoute {
  static const String path = '/forgot-password';
  static const String name = 'forgot-password';

  static GoRoute get route => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => const ForgotPasswordPage(),
  );

  static void go(BuildContext context) {
    context.goNamed(name);
  }

  static void push(BuildContext context) {
    context.pushNamed(name);
  }
}
