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
      borderRadius: context.radiusValues.circularLarge,
      overlayColor: WidgetStateProperty.all(
        context.primaryColor.withValues(alpha: 0.1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.paddingValues.small,
          vertical: context.paddingValues.medium,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: context.spacingValues.small,
          width: isActive
              ? context.spacingValues.xxlarge
              : context.spacingValues.small,
          decoration: BoxDecoration(
            color: isActive
                ? context.primaryColor
                : context.colorScheme.surfaceContainerHighest,
            borderRadius: context.radiusValues.circularMedium,
          ),
        ),
      ),
    );
  }
}
