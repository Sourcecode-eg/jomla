import 'package:flutter/material.dart';
import 'package:jomla_market/core/helper/assets_helper.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:jomla_market/core/utils/styles/app_sized_box.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Image.asset(AppImages.arabicFlag, height: 30, width: 30),
          AppSizedBox.sizedW10,
          const Text(
            '+20',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'XXX - XXX - XXXX',
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }
}
