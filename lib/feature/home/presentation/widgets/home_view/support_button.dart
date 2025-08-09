import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:jomla_market/feature/home/presentation/widgets/home_view/support_bottom_sheet.dart';

class SupportButton extends StatelessWidget {
  const SupportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10.h,
      right: 10.w,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            isScrollControlled: true,
            builder: (context) => const SupportBottomSheet(),
          );
        },
        child: Container(
          width: 60.w,
          height: 60.h,
          decoration: const BoxDecoration(
            color: AppColors.secondaryGreen,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.lightGrey,
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Icon(Icons.headset_mic, color: Colors.white, size: 40.sp),
        ),
      ),
    );
  }
}
