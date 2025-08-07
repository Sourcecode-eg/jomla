import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 90.h,
      child: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        backgroundColor: AppColors.secondaryGreen,
        shape: CircleBorder(
          side: BorderSide(color: AppColors.pureWhite, width: 10.w),
        ),
        child: const Icon(
          Icons.shopping_cart,
          color: AppColors.pureWhite,
          size: 36,
        ),
      ),
    );
  }
}
