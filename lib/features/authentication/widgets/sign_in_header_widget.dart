import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class SignInHeaderWidget extends StatelessWidget {
  const SignInHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.spacingValues.small,
      children: [
        Text(
          'Welcome Back!',
          style: context.headlineLarge?.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Sign in to continue shopping',
          style: context.bodyLarge?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
