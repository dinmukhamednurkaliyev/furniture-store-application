import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/application/application.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ApplicationBarWidget(
        title: 'Profile',
        showBackButton: false,
      ),
      body: SafeArea(
        child: Center(
          child: Text('Profile Page'),
        ),
      ),
    );
  }
}
