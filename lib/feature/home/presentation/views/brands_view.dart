import 'package:flutter/material.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:jomla_market/feature/home/presentation/widgets/brands_view/brands_view_body.dart';
import 'package:jomla_market/feature/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:jomla_market/feature/home/presentation/widgets/custom_fab.dart';
import 'package:jomla_market/feature/home/presentation/widgets/custom_home_appbar.dart';

class BrandsView extends StatelessWidget {
  const BrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomHomeAppbar(),
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: BrandsViewBody(),
    );
  }
}
