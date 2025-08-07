import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({super.key, required this.item});
  final Widget item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          colors: [AppColors.redVariant2, AppColors.redVariant1],
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: () {},
        child: item,
      ),
    );
  }
}
