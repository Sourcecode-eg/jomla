import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/resources/colors/colors.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({super.key, required this.icon});
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
      iconSize: 32.sp,
      color: AppColors.white,
    );
  }
}
