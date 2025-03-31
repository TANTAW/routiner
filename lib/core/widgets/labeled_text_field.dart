import 'package:flutter/material.dart';
import 'package:routiner/core/theme/app_colors.dart';
import 'package:routiner/core/theme/app_text_styles.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String? hintText;
  final bool obscureText;
  final TextEditingController controller;
  final bool showClearButton;
  final Function()? onClear;
  final String? Function(String?)? validator;

  const LabeledTextField({
    Key? key,
    required this.label,
    this.hintText,
    this.obscureText = false,
    required this.controller,
    this.showClearButton = false,
    this.onClear,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelSmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            suffixIcon: showClearButton
                ? IconButton(
              icon: const Icon(Icons.close, color: Colors.grey),
              onPressed: onClear,
            )
                : null,
          ),
          validator: validator,
        ),
      ],
    );
  }
}