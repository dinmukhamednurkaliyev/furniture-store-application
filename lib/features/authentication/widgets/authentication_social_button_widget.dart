import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class AuthenticationSocialButtonWidget extends StatelessWidget {
  const AuthenticationSocialButtonWidget({
    required this.iconAssetPath,
    required this.onPressCallback,
    required this.buttonText,
    super.key,
  });
  final String buttonText;
  final String iconAssetPath;
  final VoidCallback onPressCallback;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressCallback,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        children: [
          Image.asset(
            iconAssetPath,
            height: 24,
            width: 24,
          ),

          Text(
            buttonText,
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
