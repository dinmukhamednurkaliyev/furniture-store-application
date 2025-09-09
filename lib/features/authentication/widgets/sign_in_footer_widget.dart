import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/core/utilities/extensions/extensions.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:go_router/go_router.dart';

class SignInFooterWidget extends StatelessWidget {
  const SignInFooterWidget({super.key});

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
                iconAssetPath: 'assets/icons/google.png',
                onPressCallback: () {},
                buttonText: 'Google',
              ),
            ),
            Expanded(
              child: AuthenticationSocialButtonWidget(
                iconAssetPath: 'assets/icons/facebook.png',
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
              'Dont have an account?',
              style: context.bodyLarge?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
            TextButton(
              onPressed: () {
                context.pushNamed(ApplicationRoutes.signUp.name);
              },
              child: Text(
                'Sign up',
                style: TextStyle(
                  color: context.primaryColor,
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
