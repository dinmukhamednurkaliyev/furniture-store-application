import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/application/application.dart';

class ApplicationRootWidget extends ConsumerWidget {
  const ApplicationRootWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const title = 'Furniture Store';
    final routerConfig = ref.watch(routerProvider);
    final themeModeAsync = ref.watch(themeModeProvider);

    return themeModeAsync.when(
      data: (themeMode) => MaterialApp.router(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: ApplicationThemes.light.themeData,
        darkTheme: ApplicationThemes.dark.themeData,
        themeMode: themeMode,
        routerConfig: routerConfig,
      ),
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
