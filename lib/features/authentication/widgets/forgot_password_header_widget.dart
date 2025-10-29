import 'package:application_core/application_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class ForgotPasswordHeaderWidget extends StatelessWidget {
  const ForgotPasswordHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.spacingValues.small,
      children: [
        Text(
          'Forgot Password?',
          style: context.text.headlineLarge?.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Enter your email to reset your password',
          style: context.text.bodyLarge?.copyWith(
            color: context.color.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
