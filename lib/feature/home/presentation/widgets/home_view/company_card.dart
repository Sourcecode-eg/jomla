import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/helper/assets_helper.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({super.key, required this.onTap, required this.img});
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
          color: AppColors.pureWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
          border: Border.all(color: Colors.grey.shade300, width: 1.w),
        ),
        child: Center(
          child: CachedNetworkImage(
            imageUrl: img,
            width: 70.w,
            height: 70.w,
            fit: BoxFit.contain,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(color: AppColors.redVariant1),
            ),
            errorWidget: (context, url, error) =>
                Image.asset(AppImages.fallbackImg, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
