import 'package:application_core/application_core.dart';
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
      backgroundColor: WidgetStateProperty.all(context.color.surface),
      elevation: WidgetStateProperty.all(0),
      overlayColor: WidgetStateProperty.all(
        context.color.primary.withValues(alpha: 0.1),
      ),
      hintStyle: WidgetStateProperty.all(
        context.text.bodyLarge?.copyWith(
          color: context.hintColor,
        ),
      ),
      textStyle: WidgetStateProperty.all(
        context.text.bodyLarge?.copyWith(
          color: context.color.onSurface,
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
