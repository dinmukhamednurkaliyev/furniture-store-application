import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class AuthenticationSocialButtonWidget extends StatelessWidget {
  const AuthenticationSocialButtonWidget({
    required this.icon,
    required this.onPressed,
    required this.text,
    super.key,
  });
  final String text;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 24,
            width: 24,
          ),
          const SizedBox(
            width: 12,
          ),

          Text(
            text,
            style: context.bodyMedium?.copyWith(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
