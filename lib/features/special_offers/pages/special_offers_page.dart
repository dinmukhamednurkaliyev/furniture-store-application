import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpecialOffersPage extends ConsumerStatefulWidget {
  const SpecialOffersPage({super.key});

  @override
  ConsumerState<SpecialOffersPage> createState() => _SpecialOffersPageState();
}

class _SpecialOffersPageState extends ConsumerState<SpecialOffersPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Special Offers Page'),
      ),
    );
  }
}
