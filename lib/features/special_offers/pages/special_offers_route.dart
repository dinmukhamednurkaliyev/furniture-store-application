import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/special_offers/pages/pages.dart';
import 'package:go_router/go_router.dart';

class SpecialOffersRoute {
  static const String path = '/special-offers';
  static const String name = 'special-offers';

  static GoRoute get route => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => const SpecialOffersPage(),
  );

  static void go(BuildContext context) {
    context.goNamed(name);
  }

  static void push(BuildContext context) {
    context.pushNamed(name);
  }
}
