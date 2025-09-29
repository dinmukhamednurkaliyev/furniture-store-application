import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class AuthenticationButtonWidget extends StatelessWidget {
  const AuthenticationButtonWidget({
    required this.onPressCallback,
    required this.buttonText,
    this.isButtonLoading = false,
    super.key,
  });
  final String buttonText;
  final VoidCallback onPressCallback;
  final bool isButtonLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isButtonLoading ? null : onPressCallback,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return context.primaryColor.withValues(alpha: 0.8);
              } else if (states.contains(WidgetState.disabled)) {
                return Colors.grey;
              }
              return context.primaryColor;
            },
          ),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          padding: WidgetStateProperty.all(context.paddingValues.vLarge),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: context.radiusValues.circularMedium,
            ),
          ),
          elevation: WidgetStateProperty.all(0),
        ),
        child: isButtonLoading
            ? SizedBox(
                height: context.spacingValues.xlarge,
                width: context.spacingValues.xlarge,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                buttonText,
                style: context.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
