import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/application/application.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ApplicationBarWidget(
        title: 'Wishlist',
      ),
      body: SafeArea(
        child: Center(
          child: Text('Wishlist Page'),
        ),
      ),
    );
  }
}
