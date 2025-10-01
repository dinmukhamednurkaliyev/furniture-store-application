import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

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
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onIndicatorTapped(int index) {
    unawaited(
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      ),
    );
  }

  void _onNext(int totalItems) {
    if (_currentPage < totalItems - 1) {
      unawaited(
        _pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        ),
      );
    }
  }

  void _completeOnboarding() {
    unawaited(
      ref.read(onboardingProvider.notifier).setOnboardingStatus(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      onboardingProvider,
      (previous, next) {
        if (!mounted) return;

        next.whenOrNull(
          data: (_) {
            if (previous is AsyncLoading) {
              SignInRoute.go(context);
            }
          },
          error: (error, stackTrace) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error.toString())),
            );
          },
        );
      },
    );

    final onboardingItems = ref.watch(onboardingItemsProvider);
    final onboardingActionState = ref.watch(onboardingProvider);

    return Scaffold(
      body: onboardingItems.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('An error occurred: $error')),
        data: (items) => OnboardingView(
          items: items,
          isActionLoading: onboardingActionState.isLoading,
          currentPage: _currentPage,
          pageController: _pageController,
          onPageChanged: (newPage) {
            setState(() {
              _currentPage = newPage;
            });
          },
          onIndicatorTapped: _onIndicatorTapped,
          onNext: () => _onNext(items.length),
          onSkip: _completeOnboarding,
          onGetStarted: _completeOnboarding,
        ),
      ),
    );
  }
}
