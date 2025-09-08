import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/application/application.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ApplicationBarWidget(
        title: 'Blog',
        showBackButton: false,
      ),
      body: SafeArea(
        child: Center(
          child: Text('Blog Page'),
        ),
      ),
    );
  }
}
