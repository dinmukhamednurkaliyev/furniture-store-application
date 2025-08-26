import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/application/application.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  static const _animationDuration = Duration(milliseconds: 1500);
  static const _navigationDelay = Duration(milliseconds: 500);

  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutCubic,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(curvedAnimation);

    _animationController.forward().whenComplete(_navigateToNextScreen);
  }

  void _navigateToNextScreen() {
    Future.delayed(_navigationDelay, () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (_) => const OnboardingPage(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _AnimatedLogo(
              fadeAnimation: _fadeAnimation,
              slideAnimation: _slideAnimation,
            ),

            const SizedBox(height: 24),
            _AnimatedTexts(
              fadeAnimation: _fadeAnimation,
              slideAnimation: _slideAnimation,
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedLogo extends StatelessWidget {
  const _AnimatedLogo({
    required this.fadeAnimation,
    required this.slideAnimation,
  });

  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    final logoSize = min(context.screenWidth, context.screenHeight) * 0.25;
    final iconSize = logoSize * 0.33;

    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: Container(
          height: logoSize,
          width: logoSize,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: context.primaryColor.withAlpha(25),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: context.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.chair_outlined,
              color: Colors.white,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedTexts extends StatelessWidget {
  const _AnimatedTexts({
    required this.fadeAnimation,
    required this.slideAnimation,
  });

  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    final titleFontSize = context.isMobileScreen ? 32.0 : 48.0;
    final subtitleFontSize = context.isMobileScreen ? 16.0 : 22.0;

    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: Column(
          children: [
            Text(
              'Furniture Store',
              style: context.displayLarge?.copyWith(fontSize: titleFontSize),
            ),
            const SizedBox(height: 8),
            Text(
              'Make your home beautiful',
              style: context.bodyLarge?.copyWith(
                fontSize: subtitleFontSize,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
