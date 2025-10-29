import 'package:application_core/application_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacingValues.xlarge,
      children: [
        const AuthenticationDividerWidget(),
        Row(
          spacing: context.spacingValues.medium,
          children: [
            Expanded(
              child: AuthenticationSocialButtonWidget(
                icon: ApplicationCore.assets.icons.google.path,
                onPressCallback: () {},
                buttonText: 'Google',
              ),
            ),
            Expanded(
              child: AuthenticationSocialButtonWidget(
                icon: ApplicationCore.assets.icons.facebook.path,
                onPressCallback: () {},
                buttonText: 'Facebook',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: context.text.bodyLarge?.copyWith(
                color: context.color.onSurfaceVariant,
              ),
            ),
            TextButton(
              onPressed: () {
                SignInRoute.push(context);
              },
              style: TextButton.styleFrom(
                foregroundColor: context.color.primary,
                overlayColor: context.color.primary.withValues(alpha: 0.1),
              ),
              child: const Text(
                'Sign in',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
