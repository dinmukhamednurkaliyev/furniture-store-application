import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/features.dart';

class ApplicationRootWidget extends StatelessWidget {
  const ApplicationRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Furniture Store';
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
