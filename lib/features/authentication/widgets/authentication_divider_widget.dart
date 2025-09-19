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
            color: context.colorScheme.outlineVariant,
          ),
        ),
        Padding(
          padding: context.paddingValues.hLarge,
          child: Text(
            ' Or continue with',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: context.colorScheme.outlineVariant,
          ),
        ),
      ],
    );
  }
}
