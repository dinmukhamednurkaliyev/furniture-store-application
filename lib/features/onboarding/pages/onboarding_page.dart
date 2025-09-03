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
    ref.listen(
      onboardingActionNotifierProvider,
      (previous, next) {
        next.when(
          data: (_) {
            if (previous is AsyncLoading) {
              context.goNamed(ApplicationRoutes.signIn.name);
            }
          },
          error: (error, stackTrace) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error.toString())),
            );
          },
          loading: () {},
        );
      },
    );

    final onboardingItems = ref.watch(onboardingItemsProvider);
    final isActionLoading = ref
        .watch(onboardingActionNotifierProvider)
        .isLoading;

    return Scaffold(
      body: onboardingItems.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('An error occurred: $error')),
        data: (items) => OnboardingView(
          items: items,
          isActionLoading: isActionLoading,
          currentPage: _currentPage,
          pageController: _pageController,
          onIndicatorTapped: _onIndicatorTapped,
          onNext: _onNext,
          onSkip: () => ref
              .read(onboardingActionNotifierProvider.notifier)
              .setOnboardingStatus(),
          onGetStarted: () => ref
              .read(onboardingActionNotifierProvider.notifier)
              .setOnboardingStatus(),
        ),
      ),
    );
  }
}
