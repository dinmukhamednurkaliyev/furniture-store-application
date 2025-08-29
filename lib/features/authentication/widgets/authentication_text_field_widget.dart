import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/utilities/extensions/extensions.dart';

class AuthenticationTextFieldWidget extends StatelessWidget {
  const AuthenticationTextFieldWidget({
    required this.controller,
    required this.hintText,
    required this.label,
    this.textInputAction = TextInputAction.none,
    this.isEnable = true,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    super.key,
    this.validator,
    this.prefixIcon,
  });
  final String label;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool isEnable;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: context.bodyLarge?.copyWith(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          validator: validator,
          keyboardType: keyboardType,
          enabled: isEnable,
          textInputAction: textInputAction,
          style: context.bodyLarge,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: context.bodyLarge?.copyWith(
              color: Colors.grey.shade400,
            ),
            filled: true,
            fillColor: isEnable ? Colors.grey.shade100 : Colors.grey.shade50,
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
