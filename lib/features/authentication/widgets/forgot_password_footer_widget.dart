import 'package:application_core/application_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class ForgotPasswordFooterWidget extends StatelessWidget {
  const ForgotPasswordFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Remember your password?',
          style: context.text.bodyLarge?.copyWith(
            color: context.color.onSurfaceVariant,
          ),
        ),
        TextButton(
          onPressed: () {
            SignInRoute.push(context);
          },
          style: TextButton.styleFrom(
            foregroundColor: context.color.primary,
            overlayColor: context.color.primary.withValues(alpha: 0.1),
          ),
          child: const Text(
            'Sign in',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
