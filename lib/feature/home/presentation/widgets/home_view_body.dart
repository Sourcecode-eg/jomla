import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/resources/images/images.dart';
import 'package:jomla_market/feature/home/data/models/category_model.dart';
import 'package:jomla_market/feature/home/presentation/widgets/category_card.dart';
import 'package:jomla_market/feature/home/presentation/widgets/category_title.dart';
import 'package:jomla_market/feature/home/presentation/widgets/featured_category_card.dart';
import 'package:jomla_market/feature/home/presentation/widgets/location_selector.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      CategoryModel(title: 'البسكويت والحلويات', image: AppImages.biscuits),
      CategoryModel(title: 'البسكويت والحلويات', image: AppImages.biscuits),
      CategoryModel(title: 'البسكويت والحلويات', image: AppImages.biscuits),
      CategoryModel(title: 'البسكويت والحلويات', image: AppImages.biscuits),
      CategoryModel(title: 'البسكويت والحلويات', image: AppImages.biscuits),
      CategoryModel(title: 'البسكويت والحلويات', image: AppImages.biscuits),
      CategoryModel(title: 'البسكويت والحلويات', image: AppImages.biscuits),
      CategoryModel(title: 'البسكويت والحلويات', image: AppImages.biscuits),
      CategoryModel(title: 'البسكويت والحلويات', image: AppImages.biscuits),
    ];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            const LocationSelector(),
            const CategoryTitle(title: 'الأقسام'),
            FeaturedCategoryCard(
              onTap: () {},
              categoryModel: CategoryModel(
                title: 'البسكويت والحلويات',
                image: AppImages.biscuits,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 22.h),
              child: GridView.builder(
                itemCount: 9,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 20.w,
                  childAspectRatio: 0.8.w,
                ),
                itemBuilder: (context, index) => CategoryCard(
                  onTap: () {},
                  categoryModel: categories[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
