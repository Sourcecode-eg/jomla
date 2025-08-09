import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/feature/home/presentation/widgets/category_view/all_brands_button.dart';
import 'package:jomla_market/feature/home/presentation/widgets/home_view/brand_card.dart';

class BrandsList extends StatelessWidget {
  final List<String> brands;
  final VoidCallback onAllBrandsTap;

  const BrandsList({
    super.key,
    required this.brands,
    required this.onAllBrandsTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        itemCount: brands.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: AllBrandsButton(onTap: onAllBrandsTap),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: BrandCard(img: brands[index - 1], onTap: () {}),
            );
          }
        },
      ),
    );
  }
}
