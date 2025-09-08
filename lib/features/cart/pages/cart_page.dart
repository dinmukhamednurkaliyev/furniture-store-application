import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/application/application.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ApplicationBarWidget(
        title: 'Cart',
        showBackButton: false,
      ),
      body: SafeArea(
        child: Center(
          child: Text('Cart Page'),
        ),
      ),
    );
  }
}
