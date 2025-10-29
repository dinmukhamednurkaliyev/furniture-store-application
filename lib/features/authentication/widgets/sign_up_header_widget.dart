import 'package:application_core/application_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class SignUpHeaderWidget extends StatelessWidget {
  const SignUpHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.spacingValues.small,
      children: [
        Text(
          'Create account',
          style: context.text.headlineLarge?.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Sign up to get started',
          style: context.text.headlineLarge?.copyWith(
            fontSize: 16,
            color: context.color.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
