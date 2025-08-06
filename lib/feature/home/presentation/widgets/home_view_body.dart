import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/resources/images/images.dart';
import 'package:jomla_market/core/widgets/custom_grid_view.dart';
import 'package:jomla_market/core/widgets/main_banner.dart';
import 'package:jomla_market/feature/home/data/models/category_model.dart';
import 'package:jomla_market/feature/home/presentation/widgets/category_card.dart';
import 'package:jomla_market/feature/home/presentation/widgets/category_title.dart';
import 'package:jomla_market/feature/home/presentation/widgets/company_card.dart';
import 'package:jomla_market/feature/home/presentation/widgets/featured_category_card.dart';
import 'package:jomla_market/feature/home/presentation/widgets/location_selector.dart';
import 'package:jomla_market/feature/home/presentation/widgets/offers_list_view.dart';

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
    final List<String> companies = [
      AppImages.company,
      AppImages.company,
      AppImages.company,
      AppImages.company,
      AppImages.company,
      AppImages.company,
      AppImages.company,
      AppImages.company,
      AppImages.company,
    ];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            const LocationSelector(),
            const MainBanner(),
            const CategoryTitle(title: 'الأقسام'),
            FeaturedCategoryCard(
              onTap: () {},
              categoryModel: CategoryModel(
                title: 'البسكويت والحلويات',
                image: AppImages.biscuits,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: CustomGridView(
                items: categories,
                itemBuilder: (category) =>
                    CategoryCard(onTap: () {}, categoryModel: category),
              ),
            ),
            const CategoryTitle(title: 'الشركات'),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomGridView(
                items: companies,
                itemBuilder: (company) =>
                    CompanyCard(onTap: () {}, img: company),
              ),
            ),
            const CategoryTitle(title: 'العروض'),
            const OffersListView(),
          ],
        ),
      ),
    );
  }
}
