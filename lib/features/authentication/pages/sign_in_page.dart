import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final GlobalKey<FormState> _signInFormGlobalKey = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  Future<void> _handleSignInAttempt() async {
    if (_signInFormGlobalKey.currentState?.validate() ?? false) {
      await ref
          .read(authenticationNotifierProvider.notifier)
          .signIn(
            _emailTextEditingController.text,
            _passwordTextEditingController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authenticationNotifierProvider, (previous, next) {
      next.when(
        data: (user) {
          if (user != null) {
            context.goNamed(ApplicationRoutes.home.name);
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

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, viewportConstraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 600,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SignInHeaderWidget(),
                        const SizedBox(height: 20),
                        SignInFormWidget(
                          formKey: _signInFormGlobalKey,
                          emailController: _emailTextEditingController,
                          passwordController: _passwordTextEditingController,
                          onSignIn: _handleSignInAttempt,
                        ),
                        const SizedBox(height: 20),
                        const SignInFooterWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
