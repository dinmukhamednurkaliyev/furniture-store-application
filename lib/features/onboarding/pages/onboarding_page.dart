import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  late final PageController _pageController;
  int _currentPage = 0;

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

  Future<void> _setOnboardingStatusAndNavigate() async {
    await ref.read(onboardingNotifierProvider.notifier).setOnboardingStatus();

    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final onboardingItemsAsync = ref.watch(onboardingItemsFutureProvider);

    return Scaffold(
      body: onboardingItemsAsync.when(
        data: (result) {
          return switch (result) {
            Success(data: final items) => _buildContent(items),

            Error(failure: final f) => Center(
              child: Text('Error: ${f.message}'),
            ),
          };
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('An error occurred: $err')),
      ),
    );
  }

  Widget _buildContent(List<OnboardingItemEntity> items) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return OnboardingPageContent(item: items[index]);
              },
            ),
          ),
          PageIndicators(
            itemCount: items.length,
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
          OnboardingBottomBar(
            currentPage: _currentPage,
            itemCount: items.length,
            onNext: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
            onSkip: _setOnboardingStatusAndNavigate,
            onGetStarted: _setOnboardingStatusAndNavigate,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
