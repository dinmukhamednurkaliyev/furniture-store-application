import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/application/application.dart';

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

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  late final PageController _pageController;
  int _currentPage = 0;

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
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      final newPage = _pageController.page?.round() ?? 0;
      if (newPage != _currentPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _completeOnboarding() {
    ref.read(applicationStateNotifierProvider.notifier).markOnboardingSeen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.surfaceColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingItems.length,
                itemBuilder: (context, index) {
                  return _OnboardingPageContent(item: _onboardingItems[index]);
                },
              ),
            ),
            _PageIndicators(
              itemCount: _onboardingItems.length,
              currentPage: _currentPage,
              onIndicatorTapped: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
            ),
            const SizedBox(height: 16),
            _OnboardingBottomBar(
              currentPage: _currentPage,
              itemCount: _onboardingItems.length,
              onNext: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              onSkip: _completeOnboarding,
              onGetStarted: _completeOnboarding,
            ),
            const SizedBox(height: 16),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(item.imagePath, height: context.screenHeight * 0.4),
          const SizedBox(height: 48),
          _TextContent(title: item.title, description: item.description),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              item.imagePath,
              height: context.screenHeight * 0.6,
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            child: _TextContent(
              title: item.title,
              description: item.description,
            ),
          ),
        ],
      ),
    );
  }
}

class _TextContent extends StatelessWidget {
  const _TextContent({required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.displayLarge?.copyWith(fontSize: 24),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.bodyLarge?.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}

class _PageIndicators extends StatelessWidget {
  const _PageIndicators({
    required this.itemCount,
    required this.currentPage,
    required this.onIndicatorTapped,
  });

  final int itemCount;
  final int currentPage;
  final ValueChanged<int> onIndicatorTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => _Indicator(
          index: index,
          isActive: currentPage == index,
          onTap: () => onIndicatorTapped(index),
        ),
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({
    required this.index,
    required this.isActive,
    required this.onTap,
  });

  final int index;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      mouseCursor: SystemMouseCursors.click,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 8,
          width: isActive ? 24 : 8,
          decoration: BoxDecoration(
            color: isActive
                ? context.theme.primaryColor
                : context.theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class _OnboardingBottomBar extends StatelessWidget {
  const _OnboardingBottomBar({
    required this.currentPage,
    required this.itemCount,
    required this.onNext,
    required this.onSkip,
    required this.onGetStarted,
  });

  final int currentPage;
  final int itemCount;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    final buttonHeight = (context.screenHeight * 0.065).clamp(48.0, 60.0);
    final buttonStyle = ElevatedButton.styleFrom(
      minimumSize: Size(0, buttonHeight),
      padding: const EdgeInsets.symmetric(horizontal: 32),
    );
    final isLastPage = currentPage == itemCount - 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: isLastPage
          ? ElevatedButton(
              style: buttonStyle.copyWith(
                minimumSize: WidgetStateProperty.all(
                  Size(double.infinity, buttonHeight),
                ),
              ),
              onPressed: onGetStarted,
              child: const Text('Get Started'),
            )
          : Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(0, buttonHeight),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onPressed: onSkip,
                  child: const Text('Skip'),
                ),
                const Spacer(),
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: onNext,
                  child: const Text('Next'),
                ),
              ],
            ),
    );
  }
}
