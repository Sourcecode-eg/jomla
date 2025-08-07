import 'package:flutter/material.dart';
import 'package:jomla_market/core/helper/assets_helper.dart';
import 'package:jomla_market/core/helper/navigation_helper.dart';
import 'package:jomla_market/core/shared_widget/custom_button.dart';
import 'package:jomla_market/feature/create_account/view/create_acc_view.dart';
import 'package:jomla_market/feature/login/view/login_view.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:jomla_market/core/utils/styles/app_sized_box.dart';
import 'package:jomla_market/core/utils/styles/app_text_style.dart';

class SelectAuthWayView extends StatelessWidget {
  const SelectAuthWayView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              AppSizedBox.sizedH50,
              Center(
                  child: Image.asset(
                AppImages.appLogo,
                width: double.infinity,
              )),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: screenHeight / 1.55,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset(AppImages.onBoardLogo),
                      const Text("توصيل خلال 24 ساعة",
                          style: AppTextStyle.textStyleBoldBlack20),
                      const Text(
                        "اطلب طلبك قبل الساعة  12.00  صباحا وهجيلك طلبك ثاني يوم",
                        style: AppTextStyle.textStyleRegularBlack,
                      ),
                      AppSizedBox.sizedH10,
                      CustomButton(
                        text: "أنشئ حساب",
                        icon: Icons.navigate_next,
                        onPressed: () {
                          navigateAndFinish(context, const CreateAccountView());
                        },
                        buttonColor: AppColors.red,
                        textColor: AppColors.white,
                        iconBackgroundColor: AppColors.white,
                      ),
                      AppSizedBox.sizedH10,
                      CustomButton(
                        text: "تسحيل الدخول",
                        icon: Icons.navigate_next,
                        onPressed: () {
                          navigateAndFinish(context, const LoginView());
                        },
                        buttonColor: AppColors.green,
                        textColor: AppColors.white,
                        iconBackgroundColor: AppColors.white,
                      ),
                      AppSizedBox.sizedH10,
                      const Text(
                        "تخطي",
                        style: AppTextStyle.textStyleBoldBlack20,
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
