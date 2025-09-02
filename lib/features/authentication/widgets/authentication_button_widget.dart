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
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: isButtonLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
