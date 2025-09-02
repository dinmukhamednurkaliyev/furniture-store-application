import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class SignInHeaderWidget extends StatelessWidget {
  const SignInHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          'Welcome Back!',
          style: context.headlineLarge,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Sign in to continue shopping',
          style: context.bodyLarge?.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
