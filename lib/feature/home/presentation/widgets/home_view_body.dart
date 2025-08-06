import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/resources/styles/app_text_style.dart';
import 'package:jomla_market/feature/home/presentation/widgets/location_selector.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            const LocationSelector(),
            Row(
              children: [
                Expanded(
                  child: Text('الأقسام', style: AppTextStyle.bodyText20),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Text('المزيد', style: AppTextStyle.bodyText16),
                      const Icon(Icons.arrow_right),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
