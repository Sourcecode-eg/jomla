import 'package:flutter/material.dart';
import 'package:jomla_market/feature/home/presentation/widgets/custom_fab.dart';
import 'package:jomla_market/feature/home/presentation/widgets/custom_home_appbar.dart';
import 'package:jomla_market/feature/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:jomla_market/feature/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(),
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: HomeViewBody(),
    );
  }
}
