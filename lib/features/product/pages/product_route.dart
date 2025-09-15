import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:go_router/go_router.dart';

class ProductRoute {
  static const String path = '/product';
  static const String name = 'product';

  static GoRoute get route => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => const ProductPage(),
  );

  static void go(BuildContext context) {
    context.goNamed(name);
  }

  static void push(BuildContext context) {
    context.pushNamed(name);
  }
}
