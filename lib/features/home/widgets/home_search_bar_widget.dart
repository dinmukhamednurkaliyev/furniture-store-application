import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: context.surfaceColor,
        borderRadius: context.radiusValues.circularLarge,
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: context.radiusValues.circularLarge,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(context.paddingValues.large),
          child: Row(
            spacing: context.spacingValues.medium,
            children: [
              Icon(
                Icons.search,
                color: context.hintColor,
              ),
              Text(
                'Search furniture...',
                style: context.bodyLarge?.copyWith(
                  color: context.hintColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
