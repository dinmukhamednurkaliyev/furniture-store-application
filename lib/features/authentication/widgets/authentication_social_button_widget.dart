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
        padding: context.paddingValues.vLarge,
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(
          borderRadius: context.radiusValues.circularMedium,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: context.spacingValues.medium,
        children: [
          Image.asset(
            iconAssetPath,
            height: context.spacingValues.xxlarge,
            width: context.spacingValues.xxlarge,
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
