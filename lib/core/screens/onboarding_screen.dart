import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  static const List<_OnboardingItem> _onboardingItems = [
    _OnboardingItem(
      title: 'Welcome to Furniture Store',
      description: 'Discover the best furniture for your home.',
      imagePath: 'assets/images/onboarding1.png',
    ),
    _OnboardingItem(
      title: 'Quality Products',
      description: 'We offer high-quality furniture at affordable prices.',
      imagePath: 'assets/images/onboarding2.png',
    ),
    _OnboardingItem(
      title: 'Easy Shopping',
      description:
          'Shop from the comfort of your home with our easy-to-use app.',
      imagePath: 'assets/images/onboarding3.png',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  void _goToHomeScreen() {}

  void _onNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final verticalPadding = context.screenHeight * 0.02;

    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingItems.length,
                onPageChanged: (index) {
                  _currentPageNotifier.value = index;
                },
                itemBuilder: (context, index) {
                  return _OnboardingPageContent(item: _onboardingItems[index]);
                },
              ),
            ),
            _PageIndicators(
              itemCount: _onboardingItems.length,
              currentPageNotifier: _currentPageNotifier,
              onIndicatorTapped: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
            ),
            SizedBox(height: verticalPadding),
            _OnboardingBottomBar(
              itemCount: _onboardingItems.length,
              currentPageNotifier: _currentPageNotifier,
              onNext: _onNextPage,
              onSkip: _goToHomeScreen,
              onGetStarted: _goToHomeScreen,
            ),
            SizedBox(height: verticalPadding),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPageContent extends StatelessWidget {
  const _OnboardingPageContent({required this.item});
  final _OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    return context.isMobileScreen
        ? _buildPortraitLayout(context)
        : _buildLandscapeLayout(context);
  }

  Widget _buildPortraitLayout(BuildContext context) {
    final imageHeight = (context.screenHeight * 0.4).clamp(250.0, 400.0);
    const titleFontSize = 24.0;
    const descriptionFontSize = 16.0;
    final titleSpacing = context.screenHeight * 0.05;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(item.imagePath, height: imageHeight),
          SizedBox(height: titleSpacing),
          _buildTextContent(context, titleFontSize, descriptionFontSize),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    final imageHeight = (context.screenHeight * 0.6).clamp(300.0, 500.0);
    const titleFontSize = 32.0;
    const descriptionFontSize = 18.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(item.imagePath, height: imageHeight),
          ),
          const SizedBox(width: 48),
          Expanded(
            child: _buildTextContent(
              context,
              titleFontSize,
              descriptionFontSize,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(
    BuildContext context,
    double titleFontSize,
    double descriptionFontSize,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          item.title,
          textAlign: TextAlign.center,
          style: context.displayLarge?.copyWith(fontSize: titleFontSize),
        ),
        const SizedBox(height: 16),
        Text(
          item.description,
          textAlign: TextAlign.center,
          style: context.bodyLarge?.copyWith(fontSize: descriptionFontSize),
        ),
      ],
    );
  }
}

class _PageIndicators extends StatelessWidget {
  const _PageIndicators({
    required this.itemCount,
    required this.currentPageNotifier,
    required this.onIndicatorTapped,
  });

  final int itemCount;
  final ValueNotifier<int> currentPageNotifier;
  final ValueChanged<int>? onIndicatorTapped;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentPageNotifier,
      builder: (context, currentPage, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(itemCount, (index) {
            final isActive = currentPage == index;

            final indicator = AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 9,
              width: isActive ? 24 : 8,
              decoration: BoxDecoration(
                color: isActive
                    ? context.primaryColor
                    : context.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
            );

            return Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () => onIndicatorTapped!(index),
                mouseCursor: SystemMouseCursors.click,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: indicator,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

class _OnboardingBottomBar extends StatelessWidget {
  const _OnboardingBottomBar({
    required this.itemCount,
    required this.currentPageNotifier,
    required this.onNext,
    required this.onSkip,
    required this.onGetStarted,
  });
  final int itemCount;
  final ValueNotifier<int> currentPageNotifier;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    final buttonHeight = (context.screenHeight * 0.065).clamp(48.0, 60.0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ValueListenableBuilder<int>(
        valueListenable: currentPageNotifier,
        builder: (context, currentPage, _) {
          final isLastPage = currentPage.isLastIndex(itemCount);

          return isLastPage
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, buttonHeight),
                  ),
                  onPressed: onGetStarted,
                  child: const Text('Get Started'),
                )
              : Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(
                          0,
                          buttonHeight,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: onSkip,
                      child: const Text('Skip'),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          0,
                          buttonHeight,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                      ),
                      onPressed: onNext,
                      child: const Text('Next'),
                    ),
                  ],
                );
        },
      ),
    );
  }
}

@immutable
class _OnboardingItem {
  const _OnboardingItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  final String title;
  final String description;
  final String imagePath;
}
