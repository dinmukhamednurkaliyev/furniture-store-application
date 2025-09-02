import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';

class AuthenticationTextFieldWidget extends StatelessWidget {
  const AuthenticationTextFieldWidget({
    required this.textEditingController,
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
  final TextEditingController textEditingController;
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
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: textEditingController,
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
              color: Colors.grey.shade400,
            ),
            filled: true,
            fillColor: isEnabledInput
                ? Colors.grey.shade100
                : Colors.grey.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}
