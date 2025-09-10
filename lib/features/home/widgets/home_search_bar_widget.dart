import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onTap: onTap,
      leading: Icon(
        Icons.search_rounded,
        color: context.hintColor,
      ),
      hintText: 'Find your favorite furniture',
      trailing: [
        Icon(
          Icons.tune_rounded,
          color: context.hintColor,
        ),
      ],
      backgroundColor: WidgetStateProperty.all(context.surfaceColor),
      elevation: WidgetStateProperty.all(0),
      overlayColor: WidgetStateProperty.all(
        context.colorScheme.primary.withValues(alpha: 0.1),
      ),
      hintStyle: WidgetStateProperty.all(
        context.bodyLarge?.copyWith(
          color: context.hintColor,
        ),
      ),
      textStyle: WidgetStateProperty.all(
        context.bodyLarge?.copyWith(
          color: context.colorScheme.onSurface,
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: context.radiusValues.circularLarge,
        ),
      ),
    );
  }
}
