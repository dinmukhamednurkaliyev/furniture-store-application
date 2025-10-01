import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onSignUp,

    required this.isButtonLoading,
    this.error,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onSignUp;

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
            prefixIconWidget: const Icon(Icons.person),
            textController: nameController,
            hintTextInputText: 'Enter your full name',
            labelText: 'Full Name',
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your full name';
              }
              return null;
            },
          ),
          AuthenticationTextFieldWidget(
            prefixIconWidget: const Icon(Icons.email),
            textController: emailController,
            hintTextInputText: 'Enter your email',
            labelText: 'Email',
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
          AuthenticationTextFieldWidget(
            prefixIconWidget: const Icon(Icons.lock),
            textController: passwordController,
            isPasswordInput: true,
            hintTextInputText: 'Create a password',
            labelText: 'Password',
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
          ),
          AuthenticationTextFieldWidget(
            prefixIconWidget: const Icon(Icons.lock),
            textController: confirmPasswordController,
            isPasswordInput: true,
            hintTextInputText: 'Confirm your password',
            labelText: 'Confirm Password',
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),

          if (error != null)
            Padding(
              padding: EdgeInsets.only(bottom: context.paddingValues.large),
              child: Text(
                error.toString(),
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
          AuthenticationButtonWidget(
            buttonText: 'Sign Up',
            onPressCallback: onSignUp,

            isButtonLoading: isButtonLoading,
          ),
        ],
      ),
    );
  }
}
