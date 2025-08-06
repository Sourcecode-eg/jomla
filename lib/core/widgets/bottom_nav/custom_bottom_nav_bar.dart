import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/resources/colors/colors.dart';
import 'package:jomla_market/core/widgets/app_bar/nav_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r),topRight: Radius.circular(30.r)),
            gradient: const LinearGradient(
              colors: [AppColors.redVariant1, AppColors.redVariant2],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        BottomAppBar(
          color: Colors.transparent,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const NavBarItem(icon: Icons.home),
              const NavBarItem(icon: Icons.local_offer_sharp),
              SizedBox(width: 40.w),
              const NavBarItem(icon: Icons.notifications),
              const NavBarItem(icon: Icons.more_horiz),
            ].toList(),
          ),
        ),
      ],
    );
  }
}
