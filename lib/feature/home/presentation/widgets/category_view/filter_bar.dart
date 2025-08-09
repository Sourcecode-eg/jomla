import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/utils/styles/app_text_style.dart';

class FilterBar extends StatelessWidget {
  final int productsCount;
  final VoidCallback onFilterTap;

  const FilterBar({
    super.key,
    required this.productsCount,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Text("$productsCount منتج", style: AppTextStyle.bodyText16),
            const Spacer(),
            InkWell(
              onTap: onFilterTap,
              child: Row(
                children: [
                  Icon(Icons.filter_list, size: 26.sp),
                  SizedBox(width: 5.w),
                  Text("تصفية النتائج", style: AppTextStyle.bodyText16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
