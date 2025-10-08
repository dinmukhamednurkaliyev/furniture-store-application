import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/application/application.dart';

class ApplicationRootWidget extends ConsumerWidget {
  const ApplicationRootWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = 'Furniture Store';
    final routerConfig = ref.watch(routerProvider);
    final theme = ApplicationThemes.light.themeData;
    final darkTheme = ApplicationThemes.dark.themeData;

    return MaterialApp.router(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: darkTheme,
      routerConfig: routerConfig,
    );
  }
}
