import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordFooterWidget extends StatelessWidget {
  const ForgotPasswordFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Remember your password?',
          style: context.bodyLarge?.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
        TextButton(
          onPressed: () {
            context.pushNamed(ApplicationRoutes.signIn.name);
          },
          style: TextButton.styleFrom(
            foregroundColor: context.primaryColor,
            overlayColor: context.primaryColor.withValues(alpha: 0.1),
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
