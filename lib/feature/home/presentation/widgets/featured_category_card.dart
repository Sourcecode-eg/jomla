import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/resources/colors/colors.dart';
import 'package:jomla_market/feature/home/data/models/category_model.dart';

class FeaturedCategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;

  final VoidCallback onTap;

  const FeaturedCategoryCard({
    super.key,

    required this.onTap,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 320.w,
              height: 65.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
                border: Border.all(color: Colors.grey.shade400, width: 1.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6.r,
                    spreadRadius: 0,
                    offset: Offset(1.w, 6.h),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    categoryModel.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -20.h,
              left: 45.w,
              child: Image.asset(
                categoryModel.image,
                width: 80.w,
                height: 80.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
