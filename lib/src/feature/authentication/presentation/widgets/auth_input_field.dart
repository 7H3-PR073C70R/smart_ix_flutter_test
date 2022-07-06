import 'package:flutter/material.dart';
import 'package:smart_ix_takehome/src/core/constants/app_colors.dart';
import 'package:smart_ix_takehome/src/core/constants/app_text_styles.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField({
    super.key,
    required this.controller,
    this.hint,
    this.obscureText = false,
    required this.keyboardType,
    required this.validator,
    required this.label,
  });

  final String label;
  final String? hint;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: AppColors.kcWhiteColor,
      style: AppTextStyles.bodyStyle.copyWith(color: Colors.white),
      obscureText: obscureText,
      decoration: InputDecoration(
        label: label.isEmpty
            ? null
            : Text(
                label,
                style: AppTextStyles.bodyStyle.copyWith(
                  color: AppColors.kcWhiteColor,
                ),
              ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kcWhiteColor,
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kcPrimaryTextColor,
          ),
        ),
      ),
    );
  }
}
