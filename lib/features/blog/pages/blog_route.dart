import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/blog/blog.dart';
import 'package:furniture_store_application/features/blog/pages/blog_page.dart';
import 'package:go_router/go_router.dart';

class BlogRoute {
  static const String path = '/blog';
  static const String name = 'blog';

  static GoRoute get route => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => const BlogPage(),
  );

  static void go(BuildContext context) {
    context.goNamed(name);
  }

  static void push(BuildContext context) {
    context.pushNamed(name);
  }
}
