import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class SignInFormWidget extends ConsumerWidget {
  const SignInFormWidget({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onSignIn,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationState = ref.watch(authenticationNotifierProvider);

    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthenticationTextFieldWidget(
            prefixIconWidget: const Icon(
              Icons.email,
            ),
            labelText: 'Email',
            hintTextInputText: 'Enter your email',
            textEditingController: emailController,
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
          const SizedBox(
            height: 20,
          ),
          AuthenticationTextFieldWidget(
            prefixIconWidget: const Icon(Icons.lock),
            labelText: 'Password',
            hintTextInputText: 'Enter your password',
            textEditingController: passwordController,
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
          const SizedBox(
            height: 12,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password ?',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
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
            buttonText: 'Sign In',
            onPressCallback: onSignIn,
            isButtonLoading: authenticationState.isLoading ?? false,
          ),
        ],
      ),
    );
  }
}
