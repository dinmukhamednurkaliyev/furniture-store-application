import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class AuthenticationTextFieldWidget extends StatelessWidget {
  const AuthenticationTextFieldWidget({
    required this.textController,
    required this.hintTextInputText,
    required this.labelText,
    this.textInputActionListener = TextInputAction.none,
    this.isEnabledInput = true,
    this.keyboardInputType = TextInputType.text,
    this.isPasswordInput = false,
    super.key,
    this.validator,
    this.prefixIconWidget,
  });
  final String labelText;
  final String hintTextInputText;
  final bool isPasswordInput;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final TextInputType keyboardInputType;
  final TextInputAction textInputActionListener;
  final bool isEnabledInput;
  final Widget? prefixIconWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: context.bodyLarge?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w400,
          ),
        ),
        context.spacingValues.verticalSmall,
        TextFormField(
          controller: textController,
          obscureText: isPasswordInput,
          validator: validator,
          keyboardType: keyboardInputType,
          enabled: isEnabledInput,
          textInputAction: textInputActionListener,
          style: context.bodyLarge,
          decoration: InputDecoration(
            prefixIcon: prefixIconWidget,
            prefixIconColor: context.colorScheme.onSurfaceVariant,
            hintText: hintTextInputText,
            hintStyle: context.bodyLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
            filled: true,
            fillColor: isEnabledInput
                ? context.colorScheme.surfaceContainerHighest
                : context.colorScheme.surfaceContainer,
            border: OutlineInputBorder(
              borderRadius: context.radiusValues.circularMedium,
              borderSide: BorderSide.none,
            ),
            contentPadding: context.paddingValues.allLarge,
          ),
        ),
      ],
    );
  }
}
