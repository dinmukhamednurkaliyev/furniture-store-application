import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class SignUpFormWidget extends ConsumerWidget {
  const SignUpFormWidget({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onSignUp,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onSignUp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationState = ref.watch(authenticationNotifierProvider);

    return Form(
      key: formKey,
      child: Column(
        spacing: 20,
        children: [
          AuthenticationTextFieldWidget(
            prefixIconWidget: const Icon(
              Icons.person,
            ),
            textEditingController: nameController,
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
            prefixIconWidget: const Icon(
              Icons.email,
            ),
            textEditingController: emailController,
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
            prefixIconWidget: const Icon(
              Icons.lock,
            ),
            textEditingController: passwordController,
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
            prefixIconWidget: const Icon(
              Icons.lock,
            ),
            textEditingController: confirmPasswordController,
            isPasswordInput: true,
            hintTextInputText: 'Confirm your password',
            labelText: 'Confirm Password',
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != passwordController.text) {
                return 'Password do not match';
              }
              return null;
            },
          ),
          if (authenticationState.errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                authenticationState.errorMessage!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
            ),
          AuthenticationButtonWidget(
            buttonText: 'Sign Up',
            onPressCallback: onSignUp,
            isButtonLoading: authenticationState.isLoading ?? false,
          ),
        ],
      ),
    );
  }
}
