import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/features.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onResetPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      unawaited(
        ref
            .read(forgotPasswordProvider.notifier)
            .resetPassword(_emailController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(forgotPasswordProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          if (previous is AsyncLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'If an account with this email exists, a password reset link has been sent.',
                ),
                backgroundColor: Colors.green,
              ),
            );
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
      );
    });

    final forgotPasswordState = ref.watch(forgotPasswordProvider);

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
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Padding(
                    padding: context.paddingValues.allXLarge,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: context.spacingValues.xlarge,
                      children: [
                        const ForgotPasswordHeaderWidget(),

                        ForgotPasswordFormWidget(
                          emailController: _emailController,
                          formKey: _formKey,
                          onResetPassword: _onResetPassword,

                          isButtonLoading: forgotPasswordState.isLoading,
                          error: forgotPasswordState.error,
                        ),
                        const ForgotPasswordFooterWidget(),
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
