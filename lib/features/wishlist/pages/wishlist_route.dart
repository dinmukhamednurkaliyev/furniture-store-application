import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/wishlist/pages/wishlist_page.dart';
import 'package:furniture_store_application/features/wishlist/wishlist.dart';
import 'package:go_router/go_router.dart';

class WishlistRoute {
  static const String path = '/wishlist';
  static const String name = 'wishlist';

  static GoRoute get route => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => const WishlistPage(),
  );

  static void go(BuildContext context) {
    context.goNamed(name);
  }

  static void push(BuildContext context) {
    context.pushNamed(name);
  }
}
