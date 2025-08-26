import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';

class ApplicationRootWidget extends ConsumerWidget {
  const ApplicationRootWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = 'Furniture Store';
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,
      routerConfig: router,
    );
  }
}
