import 'package:application_core/application_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onSignIn,

    required this.isButtonLoading,
    this.error,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSignIn;
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
          AuthenticationTextFieldWidget(
            prefixIconWidget: const Icon(Icons.lock),
            labelText: 'Password',
            hintTextInputText: 'Enter your password',
            textController: passwordController,
            isPasswordInput: true,
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
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => ForgotPasswordRoute.push(context),
              style: TextButton.styleFrom(
                foregroundColor: context.color.onSurfaceVariant,
                overlayColor: context.color.primary.withValues(alpha: 0.1),
              ),
              child: const Text(
                'Forgot Password ?',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
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
            buttonText: 'Sign In',
            onPressCallback: onSignIn,
            isButtonLoading: isButtonLoading,
          ),
        ],
      ),
    );
  }
}
