import 'package:flutter/material.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggle;

  const PasswordTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: 'كلمة السر',
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: onToggle,
          ),
        ),
      ),
    );
  }
}
