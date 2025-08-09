import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/helper/assets_helper.dart';
import 'package:jomla_market/core/helper/network/api_constants.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:jomla_market/feature/home/data/models/offer_model.dart';

class OfferCard extends StatelessWidget {
  final OfferModel offer;
  final VoidCallback onAddToCart;

  const OfferCard({super.key, required this.offer, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
      child: Container(
        padding: EdgeInsets.all(8.w),
        width: 145.w,
        height: 200.h,
        decoration: BoxDecoration(
          color: AppColors.pureWhite,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                AppImages.offerBadge,
                width: 22.w,
                height: 22.w,
              ),
            ),
            CachedNetworkImage(
              imageUrl: "${ApiConstants.networkImgUrl}${offer.imagePath}",
              width: 90.w,
              height: 90.h,
              fit: BoxFit.contain,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: AppColors.redVariant1),
              ),
              errorWidget: (context, url, error) =>
                  Image.asset(AppImages.fallbackImg, fit: BoxFit.cover),
            ),
            SizedBox(height: 5.h),
            Text(
              offer.productNameAr,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
            ),
            SizedBox(height: 5.h),
            Text(
              offer.offerValue,
              style: TextStyle(
                color: AppColors.redVariant2,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: 95.w,
              height: 25.h,
              child: ElevatedButton(
                onPressed: onAddToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Text(
                  "إضافة للسلة",
                  style: TextStyle(fontSize: 10.sp, color: AppColors.pureWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
