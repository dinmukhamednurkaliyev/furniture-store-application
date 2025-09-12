import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/cart/cart.dart';
import 'package:furniture_store_application/features/cart/pages/cart_page.dart';
import 'package:go_router/go_router.dart';

class CartRoute {
  static const String path = '/cart';
  static const String name = 'cart';

  static GoRoute get route => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => const CartPage(),
  );

  static void go(BuildContext context) {
    context.goNamed(name);
  }

  static void push(BuildContext context) {
    context.pushNamed(name);
  }
}
