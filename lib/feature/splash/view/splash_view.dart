import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jomla_market/core/helper/assets_helper.dart';
import 'package:jomla_market/core/helper/navigation_helper.dart';
import 'package:jomla_market/feature/auth_way/view/select_auth_way_view.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      navigateAndFinish(context, const SelectAuthWayView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Center(
        child: Image.asset(AppImages.appLogo),
      ),
    );
  }
}
