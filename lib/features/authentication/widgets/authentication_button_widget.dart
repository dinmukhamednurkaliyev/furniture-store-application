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
        style: ElevatedButton.styleFrom(
          backgroundColor: context.primaryColor,
          foregroundColor: Colors.white,
          padding: context.paddingValues.vLarge,
          shape: RoundedRectangleBorder(
            borderRadius: context.radiusValues.circularMedium,
          ),
          elevation: 0,
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
