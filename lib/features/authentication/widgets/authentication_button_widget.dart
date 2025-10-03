import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/application/application.dart';

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
    return PrimaryButton(
      onPressed: onPressCallback,
      text: buttonText,
      isLoading: isButtonLoading,
      isFullWidth: true,
    );
  }
}
