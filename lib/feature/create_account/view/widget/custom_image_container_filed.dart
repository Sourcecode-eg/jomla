import 'package:flutter/material.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';

class StoreImageContainer extends StatelessWidget {
  const StoreImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.gray),
      ),
      child: const Center(
        child: Icon(
          Icons.image,
          size: 45,
          color: AppColors.gray,
        ),
      ),
    );
  }
}
