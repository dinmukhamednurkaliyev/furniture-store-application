import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:furniture_store_application/features/home/home.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignInAttempt() async {
    if (formKey.currentState?.validate() ?? false) {
      await ref
          .read(authenticationNotifierProvider.notifier)
          .signIn(
            _emailController.text,
            _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authenticationNotifierProvider, (previous, next) {
      next.when(
        data: (user) {
          if (user != null) {
            HomeRoute.go(context);
          }
        },
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              backgroundColor: Colors.red,
            ),
          );
        },
        loading: () {},
      );
    });

    return AuthenticationPageLayout(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.spacingValues.xlarge,
        children: [
          const SignInHeaderWidget(),
          SignInFormWidget(
            formKey: formKey,
            emailController: _emailController,
            passwordController: _passwordController,
            onSignIn: _handleSignInAttempt,
          ),
          const SignInFooterWidget(),
        ],
      ),
    );
  }
}
