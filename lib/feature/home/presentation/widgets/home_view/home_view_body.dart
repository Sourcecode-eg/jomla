import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/helper/assets_helper.dart';
import 'package:jomla_market/core/helper/network/api_constants.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:jomla_market/core/widgets/custom_grid_view.dart';
import 'package:jomla_market/core/widgets/main_banner.dart';
import 'package:jomla_market/feature/home/data/models/category_model.dart';
import 'package:jomla_market/feature/home/presentation/cubit/home_cubit_cubit.dart';
import 'package:jomla_market/feature/home/presentation/cubit/home_cubit_state.dart';
import 'package:jomla_market/feature/home/presentation/widgets/home_view/category_card.dart';
import 'package:jomla_market/feature/home/presentation/widgets/home_view/category_title.dart';
import 'package:jomla_market/feature/home/presentation/widgets/home_view/company_card.dart';
import 'package:jomla_market/feature/home/presentation/widgets/home_view/featured_category_card.dart';
import 'package:jomla_market/feature/home/presentation/widgets/home_view/location_selector.dart';
import 'package:jomla_market/feature/home/presentation/widgets/home_view/offers_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w),
      child: BlocBuilder<HomeCubit, HomeCubitState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.redVariant1),
            );
          } else if (state is HomeLoadedSuccess) {
            final categories = state.categories;
            final brands = state.brands;
            final featuredCategory = state.categories[9];
            final offers = state.offers;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                      itemCount: 9,
                      items: categories,
                      itemBuilder: (category) =>
                          CategoryCard(onTap: () {}, categoryModel: category),
                    ),
                  ),
                  const CategoryTitle(title: 'الشركات'),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: CustomGridView(
                      itemCount: 9,
                      items: brands,
                      itemBuilder: (brand) => BrandCard(
                        onTap: () {},
                        img: "${ApiConstants.networkImgUrl}${brand.iconPath}",
                      ),
                    ),
                  ),
                  const CategoryTitle(title: 'العروض'),
                  OffersListView(offers: offers),
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
            );
          } else if (state is HomeFailure) {
            return Center(child: Text('There was an error: ${state.errMsg}'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
