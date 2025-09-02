import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({
    required this.items,
    required this.isActionLoading,
    required this.pageController,
    required this.currentPage,
    required this.onIndicatorTapped,
    required this.onNext,
    required this.onSkip,
    required this.onGetStarted,
    super.key,
  });

  final List<OnboardingItemEntity> items;
  final bool isActionLoading;
  final PageController pageController;
  final int currentPage;
  final ValueChanged<int> onIndicatorTapped;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return OnboardingPageContent(item: items[index]);
              },
            ),
          ),
          PageIndicators(
            itemCount: items.length,
            currentPage: currentPage,
            onIndicatorTapped: onIndicatorTapped,
          ),
          const SizedBox(height: 16),
          OnboardingBottomBar(
            currentPage: currentPage,
            itemCount: items.length,
            onNext: onNext,
            onSkip: onSkip,
            onGetStarted: onGetStarted,
            isActionLoading: isActionLoading,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
