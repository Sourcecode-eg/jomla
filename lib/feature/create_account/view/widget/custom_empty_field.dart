import 'package:flutter/material.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';

class CustomRoundedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool readOnly;
  final Function(String)? onChanged;

  const CustomRoundedTextField({
    super.key,
    required this.controller,
    this.hintText = '',
    required this.readOnly,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        onChanged: onChanged,
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          filled: true,
          fillColor: Colors.white,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: AppColors.borderColor, // ✅ Your custom color
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(
              color: AppColors.borderColor,
              width: 2,
            ),
          ),

          // Optional: remove this if not needed
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
