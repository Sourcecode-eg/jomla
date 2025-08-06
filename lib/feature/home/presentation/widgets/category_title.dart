import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/resources/styles/app_text_style.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 20.w, right: 5.w),
      child: Row(
        children: [
          Expanded(child: Text(title, style: AppTextStyle.bodyText20)),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Text('المزيد', style: AppTextStyle.bodyText16),
                const Icon(Icons.arrow_right),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
