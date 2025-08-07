import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:jomla_market/core/utils/images/images.dart';
import 'package:jomla_market/core/widgets/custom_grid_view.dart';
import 'package:jomla_market/core/widgets/main_banner.dart';
import 'package:jomla_market/feature/home/data/models/category_model.dart';
import 'package:jomla_market/feature/home/presentation/cubit/home_cubit_cubit.dart';
import 'package:jomla_market/feature/home/presentation/cubit/home_cubit_state.dart';
import 'package:jomla_market/feature/home/presentation/widgets/category_card.dart';
import 'package:jomla_market/feature/home/presentation/widgets/category_title.dart';
import 'package:jomla_market/feature/home/presentation/widgets/company_card.dart';
import 'package:jomla_market/feature/home/presentation/widgets/featured_category_card.dart';
import 'package:jomla_market/feature/home/presentation/widgets/location_selector.dart';
import 'package:jomla_market/feature/home/presentation/widgets/offers_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
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
    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.redVariant1),
          );
        } else if (state is HomeLoadedSuccess) {
          final categories = state.categories;
          final featuredCategory = state.categories[9];
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                children: [
                  const LocationSelector(),
                  MainBanner(
                    item: Image.asset(AppImages.banner, fit: BoxFit.fill),
                  ),
                  const CategoryTitle(title: 'الأقسام'),
                  FeaturedCategoryCard(
                    onTap: () {},
                    categoryModel: CategoryModel(
                      nameAr: featuredCategory.nameAr,
                      iconPath: featuredCategory.iconPath,
                      id: featuredCategory.id,
                      nameEn: featuredCategory.nameEn,
                      storeId: featuredCategory.storeId,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: CustomGridView(
                      itemCount: categories.length - 1,
                      items: categories,
                      itemBuilder: (category) =>
                          CategoryCard(onTap: () {}, categoryModel: category),
                    ),
                  ),
                  const CategoryTitle(title: 'الشركات'),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: CustomGridView(
                      itemCount: companies.length,
                      items: companies,
                      itemBuilder: (company) =>
                          CompanyCard(onTap: () {}, img: company),
                    ),
                  ),
                  const CategoryTitle(title: 'العروض'),
                  const OffersListView(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40.h),
                    child: MainBanner(
                      item: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                            size: 80.sp,
                            color: AppColors.pureWhite,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is HomeFailure) {
          return Center(child: Text('There was an error: ${state.errMsg}'));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
