import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class PageIndicators extends StatelessWidget {
  const PageIndicators({
    required this.itemCount,
    required this.currentPage,
    required this.onIndicatorTapped,
    super.key,
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
          isActive: currentPage == index,
          onTap: () => onIndicatorTapped(index),
        ),
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({
    required this.isActive,
    required this.onTap,
  });

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
                ? context.primaryColor
                : context.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
