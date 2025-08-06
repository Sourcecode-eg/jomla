import 'package:flutter/material.dart';
import 'package:jomla_market/core/widgets/main_banner/main_banner.dart';
import 'package:jomla_market/core/widgets/page_title/page_title.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      
      child: Column(
        
        children: [
          PageTitle(title: "البسكويت والحلويات"),
          MainBanner()
          ],
      ),
    );
  }
}
