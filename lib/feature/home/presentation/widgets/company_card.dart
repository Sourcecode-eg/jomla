import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/resources/colors/colors.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({super.key, required this.onTap, required this.img});
  final void Function() onTap;
  final String img;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        width: 100.w,
        height: 90.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
          border: Border.all(color: Colors.grey.shade300, width: 1.w),
        ),
        child: Center(
          child: Image.asset(
            img,
            width: 70.w,
            height: 70.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
