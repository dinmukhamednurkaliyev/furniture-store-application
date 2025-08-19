import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
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

    // Запускаем анимацию и добавляем слушателя для навигации
    _animationController
      ..forward()
      ..addStatusListener(_onAnimationCompleted);
  }

  /// Обработчик завершения анимации
  void _onAnimationCompleted(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Future.delayed(const Duration(milliseconds: 500), () {
        // Проверка 'mounted' - лучшая практика перед навигацией
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(
              builder: (_) => const OnboardingScreen(), // Используйте ваш экран
            ),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _animationController
      ..removeStatusListener(_onAnimationCompleted)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Используем расширение напрямую
      backgroundColor: context.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Создаем виджеты, передавая им только то, что им нужно (анимации)
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

// --- ВЫНЕСЕННЫЕ, НЕЗАВИСИМЫЕ ВИДЖЕТЫ ---

/// Анимированный виджет логотипа
class _AnimatedLogo extends StatelessWidget {
  // const конструктор - плюс к производительности!
  const _AnimatedLogo({
    required this.fadeAnimation,
    required this.slideAnimation,
  });
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: Container(
          height: 120,
          width: 120,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            // ИСПОЛЬЗУЕМ РАСШИРЕНИЕ ВНУТРИ ВИДЖЕТА!
            // И исправляем withValues на withOpacity
            color: context.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: context.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.chair_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}

/// Анимированный виджет текстов
class _AnimatedTexts extends StatelessWidget {
  const _AnimatedTexts({
    required this.fadeAnimation,
    required this.slideAnimation,
  });
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: Column(
          children: [
            Text(
              'Furniture Store',
              style: context.displayLarge?.copyWith(fontSize: 32),
            ),
            const SizedBox(height: 8),
            Text(
              'Make your home beautiful',
              style: context.bodyLarge?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
