import 'package:application_core/application_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class AuthenticationSocialButtonWidget extends StatelessWidget {
  const AuthenticationSocialButtonWidget({
    required this.icon,
    required this.onPressCallback,
    required this.buttonText,
    super.key,
  });

  final String buttonText;
  final String icon;
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
              return BorderSide(color: context.color.primary);
            }
            return BorderSide(color: context.color.outline);
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.hovered)) {
              return context.color.surfaceContainerLowest;
            }
            if (states.contains(WidgetState.pressed)) {
              return context.color.primary.withValues(alpha: 0.1);
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
          Image.asset(
            icon,
            height: context.spacingValues.xxlarge,
            width: context.spacingValues.xxlarge,
          ),
          Text(
            buttonText,
            style: context.text.bodyMedium?.copyWith(
              color: context.color.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
