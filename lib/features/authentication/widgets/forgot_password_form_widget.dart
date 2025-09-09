import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class ForgotPasswordFormWidget extends ConsumerWidget {
  const ForgotPasswordFormWidget({
    required this.onResetPassword,
    required this.emailController,
    required this.formKey,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final VoidCallback onResetPassword;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationState = ref.watch(authenticationNotifierProvider);
    return Form(
      key: formKey,
      child: Column(
        spacing: context.spacingValues.xlarge,
        children: [
          AuthenticationTextFieldWidget(
            prefixIconWidget: const Icon(Icons.email),
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
          if (authenticationState.hasError)
            Padding(
              padding: EdgeInsets.only(bottom: context.paddingValues.large),
              child: Text(
                authenticationState.error.toString(),
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
            ),
          AuthenticationButtonWidget(
            buttonText: 'Reset Password',
            onPressCallback: onResetPassword,
            isButtonLoading: authenticationState.isLoading,
          ),
        ],
      ),
    );
  }
}
