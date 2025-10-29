import 'package:application_core/application_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class AuthenticationDividerWidget extends StatelessWidget {
  const AuthenticationDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: context.color.outlineVariant,
          ),
        ),
        Padding(
          padding: context.paddingValues.hLarge,
          child: Text(
            ' Or continue with',
            style: context.text.bodyMedium?.copyWith(
              color: context.color.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: context.color.outlineVariant,
          ),
        ),
      ],
    );
  }
}
