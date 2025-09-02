import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final GlobalKey<FormState> signInFormGlobalKey = GlobalKey<FormState>();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  Future<void> handleSignInAttempt() async {
    if (signInFormGlobalKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    final currentAuthenticationState = ref.watch(
      authenticationNotifierProvider,
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Welcome Back!',
                      style: context.headlineLarge,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Sign in to continue shopping',
                      style: context.bodyLarge?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: signInFormGlobalKey,
                      child: Column(
                        children: [
                          AuthenticationTextFieldWidget(
                            prefixIconWidget: const Icon(
                              Icons.email,
                            ),
                            labelText: 'Email',
                            hintTextInputText: 'Enter your email',
                            textEditingController: emailTextEditingController,
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
                            textEditingController:
                                passwordTextEditingController,
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
                          if (currentAuthenticationState.errorMessage != null)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                currentAuthenticationState.errorMessage!,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          AuthenticationButtonWidget(
                            buttonText: 'Sign In',
                            onPressCallback: handleSignInAttempt,
                            isButtonLoading:
                                currentAuthenticationState.isLoading ?? false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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

class AuthenticationDividerWidget extends StatelessWidget {
  const AuthenticationDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey.shade300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            ' Or continue with',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}

class AuthenticationSocialButtonWidget extends StatelessWidget {
  const AuthenticationSocialButtonWidget({
    required this.iconAssetPath,
    required this.onPressCallback,
    required this.buttonText,
    super.key,
  });
  final String buttonText;
  final String iconAssetPath;
  final VoidCallback onPressCallback;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressCallback,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            iconAssetPath,
            height: 24,
            width: 24,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            buttonText,
            style: context.bodyMedium?.copyWith(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class AuthenticationTextFieldWidget extends StatelessWidget {
  const AuthenticationTextFieldWidget({
    required this.textEditingController,
    required this.hintTextInputText,
    required this.labelText,
    this.textInputActionListener = TextInputAction.none,
    this.isEnabledInput = true,
    this.keyboardInputType = TextInputType.text,
    this.isPasswordInput = false,
    super.key,
    this.validator,
    this.prefixIconWidget,
  });
  final String labelText;
  final String hintTextInputText;
  final bool isPasswordInput;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final TextInputType keyboardInputType;
  final TextInputAction textInputActionListener;
  final bool isEnabledInput;
  final Widget? prefixIconWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: context.bodyLarge?.copyWith(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: textEditingController,
          obscureText: isPasswordInput,
          validator: validator,
          keyboardType: keyboardInputType,
          enabled: isEnabledInput,
          textInputAction: textInputActionListener,
          style: context.bodyLarge,
          decoration: InputDecoration(
            prefixIcon: prefixIconWidget,
            prefixIconColor: context.colorScheme.onSurfaceVariant,
            hintText: hintTextInputText,
            hintStyle: context.bodyLarge?.copyWith(
              color: Colors.grey.shade400,
            ),
            filled: true,
            fillColor: isEnabledInput
                ? Colors.grey.shade100
                : Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}
