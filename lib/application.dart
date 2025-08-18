import 'package:flutter/material.dart';
import 'package:furniture_store_application/screens/screens.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Furniture Store';
    return const MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
