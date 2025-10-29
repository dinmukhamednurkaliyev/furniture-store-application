import 'package:application_core/application_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

class OnboardingPageContent extends StatelessWidget {
  const OnboardingPageContent({required this.item, super.key});
  final OnboardingItemEntity item;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const double wideLayoutBreakpoint = 600;
        final isWideLayout = constraints.maxWidth >= wideLayoutBreakpoint;

        return isWideLayout
            ? _buildWideLayout(context)
            : _buildNarrowLayout(context);
      },
    );
  }

  Widget _buildImage(BuildContext context, {required double height}) {
    return item.image.when(
      local: (path) => Image.asset(
        path,
        height: height,
        fit: BoxFit.contain,
      ),
      remote: (url) => Image.network(
        url,
        height: height,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error, color: Colors.red);
        },
      ),
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    final screenHeight = context.screen.height;
    return Padding(
      padding: context.paddingValues.hXLarge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildImage(context, height: screenHeight * 0.4),
          context.spacingValues.verticalXXXLarge,
          _TextContent(title: item.title, description: item.description),
        ],
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    final screenHeight = context.screen.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,

            child: _buildImage(context, height: screenHeight * 0.6),
          ),
          context.spacingValues.horizontalXXXLarge,
          Expanded(
            flex: 3,
            child: _TextContent(
              title: item.title,
              description: item.description,
            ),
          ),
        ],
      ),
    );
  }
}

class _TextContent extends StatelessWidget {
  const _TextContent({required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: context.text.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        context.spacingValues.verticalLarge,
        Text(
          description,
          textAlign: TextAlign.start,
          style: context.text.bodyLarge?.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
