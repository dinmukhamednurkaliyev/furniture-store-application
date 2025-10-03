import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.invertColors = false,
    this.isFullWidth = false,
    this.padding,
    super.key,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final bool invertColors;
  final bool isFullWidth;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = invertColors ? Colors.white : context.primaryColor;
    final foregroundColor = invertColors ? context.primaryColor : Colors.white;

    final button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.grey.withValues(alpha: 0.5);
            }
            return backgroundColor;
          },
        ),
        foregroundColor: WidgetStateProperty.all(foregroundColor),
        padding: WidgetStateProperty.all(
          padding ?? context.paddingValues.vLarge,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: context.radiusValues.circularMedium,
          ),
        ),
        elevation: WidgetStateProperty.all(0),
        overlayColor: WidgetStateProperty.all(
          (invertColors ? context.primaryColor : Colors.white).withValues(
            alpha: 0.1,
          ),
        ),
      ),
      child: isLoading
          ? SizedBox(
              height: context.spacingValues.xlarge,
              width: context.spacingValues.xlarge,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
              ),
            )
          : Text(
              text,
              style: context.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
    );

    if (isFullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    return button;
  }
}
