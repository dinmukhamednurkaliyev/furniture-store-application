import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/application/application.dart';

class OnboardingBottomBar extends StatelessWidget {
  const OnboardingBottomBar({
    required this.currentPage,
    required this.itemCount,
    required this.onNext,
    required this.onSkip,
    required this.onGetStarted,
    this.isActionLoading = false,
    super.key,
  });

  final int currentPage;
  final int itemCount;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final VoidCallback onGetStarted;
  final bool isActionLoading;

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.screenHeight;
    final buttonHeight = (screenHeight * 0.065).clamp(48.0, 60.0);
    final isLastPage = currentPage == itemCount - 1;

    final textButtonStyle = TextButton.styleFrom(
      minimumSize: Size(0, buttonHeight),
      padding: context.paddingValues.hLarge,
      foregroundColor: context.primaryColor,
      overlayColor: context.primaryColor.withValues(alpha: 0.1),
    );

    final barContent = AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.5),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: isLastPage
          ? _buildGetStartedButton(context)
          : _buildNavigationButtons(
              context,
              textButtonStyle,
            ),
    );

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Padding(
          padding: context.paddingValues.hXLarge,
          child: barContent,
        ),
      ),
    );
  }

  Widget _buildGetStartedButton(
    BuildContext context,
  ) {
    return PrimaryButton(
      key: const ValueKey('get_started_button'),
      isFullWidth: true,
      onPressed: onGetStarted,
      text: 'Get Started',
      isLoading: isActionLoading,
    );
  }

  Widget _buildNavigationButtons(
    BuildContext context,
    ButtonStyle textStyle,
  ) {
    return Row(
      key: const ValueKey('navigation_buttons'),
      children: [
        TextButton(
          style: textStyle,
          onPressed: onSkip,
          child: const Text('Skip'),
        ),
        const Spacer(),
        PrimaryButton(
          onPressed: onNext,
          text: 'Next',
          padding: context.paddingValues.hXXLarge,
        ),
      ],
    );
  }
}
