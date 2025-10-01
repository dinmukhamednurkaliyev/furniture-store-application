import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class ForgotPasswordFormWidget extends StatelessWidget {
  const ForgotPasswordFormWidget({
    required this.onResetPassword,
    required this.emailController,
    required this.formKey,
    required this.isButtonLoading,
    this.error,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final VoidCallback onResetPassword;
  final bool isButtonLoading;
  final Object? error;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: context.spacingValues.xlarge,
        children: [
          AuthenticationTextFieldWidget(
            prefixIconWidget: const Icon(Icons.email),
            labelText: 'Email',
            hintTextInputText: 'Enter your email',
            textController: emailController,
            keyboardInputType: TextInputType.emailAddress,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          if (error != null)
            Padding(
              padding: EdgeInsets.only(bottom: context.paddingValues.large),
              child: Text(
                error.toString(),
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
            ),
          AuthenticationButtonWidget(
            buttonText: 'Reset Password',
            onPressCallback: onResetPassword,
            isButtonLoading: isButtonLoading,
          ),
        ],
      ),
    );
  }
}
