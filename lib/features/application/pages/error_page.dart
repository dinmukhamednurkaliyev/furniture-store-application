import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({required this.errorMessage, super.key});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.errorContainer,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: context.colorScheme.onErrorContainer,
                size: 64,
              ),
              const SizedBox(height: 16),
              Text(
                'A critical error has occurred',
                style: context.headlineSmall?.copyWith(
                  color: context.colorScheme.onErrorContainer,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: context.bodyMedium?.copyWith(
                  color: context.colorScheme.onErrorContainer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
