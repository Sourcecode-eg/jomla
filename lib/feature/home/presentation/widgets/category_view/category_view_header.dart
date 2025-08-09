import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/feature/home/presentation/widgets/category_view/brands_list.dart';
import 'package:jomla_market/feature/home/presentation/widgets/category_view/filter_bar.dart';

class CategoryViewHeader extends StatelessWidget {
  final List<String> brands;
  final VoidCallback onAllCategoriesTap;
  final VoidCallback onFilterTap;

  const CategoryViewHeader({
    super.key,
    required this.brands,
    required this.onAllCategoriesTap,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BrandsList(brands: brands, onAllBrandsTap: onAllCategoriesTap),
        SizedBox(height: 15.h),
        FilterBar(productsCount: 0, onFilterTap: onFilterTap),
      ],
    );
  }
}
