import 'package:flutter/material.dart';
import 'package:furniture_store_application/.generated/assets.gen.dart';
import 'package:furniture_store_application/core/core.dart';

class AuthenticationSocialButtonWidget extends StatelessWidget {
  const AuthenticationSocialButtonWidget({
    required this.icon,
    required this.onPressCallback,
    required this.buttonText,
    super.key,
  });

  final String buttonText;
  final AssetGenImage icon;
  final VoidCallback onPressCallback;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressCallback,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(context.paddingValues.vLarge),
        side: WidgetStateProperty.resolveWith<BorderSide>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return BorderSide(color: context.primaryColor);
            }
            return BorderSide(color: context.colorScheme.outline);
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.hovered)) {
              return context.colorScheme.surfaceContainerLowest;
            }
            if (states.contains(WidgetState.pressed)) {
              return context.primaryColor.withValues(alpha: 0.1);
            }
            return Colors.transparent;
          },
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: context.radiusValues.circularMedium,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: context.spacingValues.medium,
        children: [
          icon.image(
            height: context.spacingValues.xxlarge,
            width: context.spacingValues.xxlarge,
          ),
          Text(
            buttonText,
            style: context.bodyMedium?.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
