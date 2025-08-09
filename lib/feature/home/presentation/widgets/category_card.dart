import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/helper/assets_helper.dart';
import 'package:jomla_market/core/helper/network/api_constants.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:jomla_market/feature/home/data/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.onTap,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        bottomLeft: Radius.circular(20.r),
        bottomRight: Radius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 100.w,
                height: 90.h,
                decoration: BoxDecoration(
                  color: AppColors.pureWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                  border: Border.all(color: Colors.grey.shade400, width: 1.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8.r,
                      spreadRadius: 0,
                      offset: Offset(1.w, 6.h),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -15.h,
                left: 0,
                right: 0,
                child: CachedNetworkImage(
                  imageUrl:
                      "${ApiConstants.networkImgUrl}${categoryModel.iconPath}",
                  width: 90.w,
                  height: 90.w,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.redVariant1,
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset(AppImages.fallbackImg, fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            categoryModel.nameAr,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
