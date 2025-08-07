import 'package:flutter/material.dart';
import 'package:jomla_market/core/helper/assets_helper.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:jomla_market/core/utils/styles/app_sized_box.dart';

class SelectLanguageView extends StatefulWidget {
  const SelectLanguageView({super.key});

  @override
  State<SelectLanguageView> createState() => _SelectLanguageViewState();
}

class _SelectLanguageViewState extends State<SelectLanguageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppSizedBox.sizedH100,
            AppSizedBox.sizedH100,
            Center(child: Image.asset(AppImages.appLogo)),
            const Spacer(),
            Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(AppImages.arabicFlag),
                          AppSizedBox.sizedW15,
                          const Text(
                            "العربيه",
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          Image.asset(AppImages.englishFlag),
                          AppSizedBox.sizedW15,
                          const Text(
                            "English",
                            style: TextStyle(
                                color: AppColors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                )),
            AppSizedBox.sizedH50,
          ],
        ),
      ),
    );
  }
}
