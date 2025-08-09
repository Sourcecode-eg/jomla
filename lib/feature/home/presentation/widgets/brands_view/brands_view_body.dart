import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/helper/network/api_constants.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:jomla_market/core/widgets/custom_grid_view.dart';
import 'package:jomla_market/feature/home/presentation/cubit/home_cubit_cubit.dart';
import 'package:jomla_market/feature/home/presentation/cubit/home_cubit_state.dart';
import 'package:jomla_market/feature/home/presentation/widgets/home_view/company_card.dart';

class BrandsViewBody extends StatefulWidget {
  const BrandsViewBody({super.key});

  @override
  State<BrandsViewBody> createState() => _BrandsViewBodyState();
}

class _BrandsViewBodyState extends State<BrandsViewBody> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getAllBrands();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<HomeCubit>().getAllBrands();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
          } else if (state is BrandsLoadedSuccess) {
            final brands = state.brands;
            return SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  CustomGridView(
                    itemCount: brands.length + 1,
                    items: brands,
                    itemBuilder: (brand) => BrandCard(
                      onTap: () {},
                      img: "${ApiConstants.networkImgUrl}${brand.iconPath}",
                    ),
                  ),
                  if (context.read<HomeCubit>().hasMore)
                    Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: const Center(child: CircularProgressIndicator()),
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
