import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

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

    final elevatedButtonStyle =
        ElevatedButton.styleFrom(
          minimumSize: Size(0, buttonHeight),
          padding: context.paddingValues.hXXLarge,
          backgroundColor: context.primaryColor,
          foregroundColor: Colors.white,
        ).copyWith(
          overlayColor: WidgetStateProperty.all(
            Colors.white.withValues(alpha: 0.1),
          ),
        );
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
          ? _buildGetStartedButton(context, elevatedButtonStyle, buttonHeight)
          : _buildNavigationButtons(
              context,
              textButtonStyle,
              elevatedButtonStyle,
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
    ButtonStyle style,
    double height,
  ) {
    return SizedBox(
      key: const ValueKey('get_started_button'),
      width: double.infinity,
      child: ElevatedButton(
        style: style,
        onPressed: isActionLoading ? null : onGetStarted,
        child: isActionLoading
            ? SizedBox(
                height: context.spacingValues.xxlarge,
                width: context.spacingValues.xxlarge,
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                ),
              )
            : const Text('Get Started'),
      ),
    );
  }

  Widget _buildNavigationButtons(
    BuildContext context,
    ButtonStyle textStyle,
    ButtonStyle elevatedStyle,
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
        ElevatedButton(
          style: elevatedStyle,
          onPressed: onNext,
          child: const Text('Next'),
        ),
      ],
    );
  }
}
