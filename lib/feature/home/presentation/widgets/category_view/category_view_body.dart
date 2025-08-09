import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/helper/assets_helper.dart';
import 'package:jomla_market/core/utils/styles/app_text_style.dart';
import 'package:jomla_market/feature/home/presentation/widgets/category_view/category_view_header.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> brandLogos = [
      "https://logos-world.net/wp-content/uploads/2020/11/Pepsi-Logo-2023.png",
      "https://download.logo.wine/logo/Cadbury/Cadbury-Logo.wine.png",
      "https://www.sustainabilitytracker.com/wp-content/uploads/2020/12/Galaxy_no-BG.png",
    ];
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CategoryViewHeader(
              brands: brandLogos,
              onAllCategoriesTap: () {},
              onFilterTap: () {},
            ),
            SizedBox(height: 15.h),
            Column(
              children: [
                Image.asset(AppImages.outOfStockImg),
                Text(
                  'لم نتمكن من العثور على \nالمنتجات التي تطابق معاييرك',
                  style: AppTextStyle.bodyText18,
                ),
                SizedBox(height: 5.h),
                Text(
                  'حاول إستخدام عوامل تصفية مختلفة للعثور على منتجات أخرى',
                  style: AppTextStyle.bodyText12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
