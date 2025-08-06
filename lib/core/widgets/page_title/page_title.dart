import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10), // padding اختياري
      child: Text(
        title,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        textAlign: TextAlign.right,
      ),
    );
  }
}
