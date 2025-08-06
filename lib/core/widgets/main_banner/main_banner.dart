import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/resources/colors/colors.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
      height: 105.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          colors: [AppColors.redVariant1, AppColors.redVariant2],
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: () {
          // Navigate or do something
        },
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                "assets/images/main_banner.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
