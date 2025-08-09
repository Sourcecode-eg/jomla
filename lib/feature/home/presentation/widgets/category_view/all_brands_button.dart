import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/utils/styles/app_text_style.dart';

class AllBrandsButton extends StatelessWidget {
  final VoidCallback onTap;

  const AllBrandsButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        bottomLeft: Radius.circular(20.r),
        bottomRight: Radius.circular(20.r),
      ),
      child: Container(
        width: 100.w,
        height: 90.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1.w),
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.grid_view, size: 30.sp),
            SizedBox(height: 5.h),
            Text('جميع الشركات', style: AppTextStyle.bodyText10),
          ],
        ),
      ),
    );
  }
}
