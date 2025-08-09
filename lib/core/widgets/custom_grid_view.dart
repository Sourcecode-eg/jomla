import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item) itemBuilder;
  final int itemCount;
  final ScrollController? controller;

  const CustomGridView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.itemCount,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.w,
        childAspectRatio: 0.8.w,
      ),
      itemBuilder: (context, index) => itemBuilder(items[index]),
    );
  }
}
