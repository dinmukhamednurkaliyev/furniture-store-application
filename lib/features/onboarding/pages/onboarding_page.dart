import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/application/application.dart';
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
    Future.microtask(
      () => ref.read(onboardingNotifierProvider.notifier).initialize(),
    );
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
      context.goNamed(ApplicationRoutes.signIn.name);
    }
  }

  void _onIndicatorTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _onNext() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentOnboardingState = ref.watch(onboardingNotifierProvider);

    return Scaffold(
      body: Builder(
        builder: (context) {
          if (currentOnboardingState.isDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentOnboardingState.errorMessage != null) {
            return Center(
              child: Text(
                'An error occurred: ${currentOnboardingState.errorMessage}',
              ),
            );
          }
          return OnboardingView(
            items: currentOnboardingState.items,
            isActionLoading: currentOnboardingState.isActionLoading,
            currentPage: _currentPage,
            pageController: _pageController,
            onIndicatorTapped: _onIndicatorTapped,
            onNext: _onNext,
            onSkip: _setOnboardingStatusAndNavigate,
            onGetStarted: _setOnboardingStatusAndNavigate,
          );
        },
      ),
    );
  }
}
