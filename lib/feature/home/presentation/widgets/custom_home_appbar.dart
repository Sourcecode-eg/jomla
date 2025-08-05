import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/resources/colors/colors.dart';
import 'package:jomla_market/core/resources/styles/app_text_style.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      height: 100.h + statusBarHeight,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.redVariant1, AppColors.redVariant2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.r)),
      ),
      padding: EdgeInsets.only(
        top: statusBarHeight + 10.h,
        left: 10.w,
        right: 10.w,
        bottom: 20.h,
      ),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(Icons.notifications, size: 24.sp),
            color: AppColors.white,
          ),
          Expanded(
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10.w),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.qr_code, size: 28.sp),
                    color: Colors.black,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "ابحث",
                        hintStyle: AppTextStyle.textStyleAppBar.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Icon(Icons.search, color: Colors.black, size: 25.sp),
                  SizedBox(width: 20.w),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Image.asset(
            'assets/images/app_logo.png',
            width: 40.w,
            height: 60.h,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
