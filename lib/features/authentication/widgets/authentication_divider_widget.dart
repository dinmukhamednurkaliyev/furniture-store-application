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
            color: Colors.grey.shade300,
          ),
        ),
        Padding(
          padding: context.paddingValues.hLarge,
          child: Text(
            ' Or continue with',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
