import 'package:flutter/material.dart';
import 'package:jomla_market/core/utils/styles/app_text_style.dart';

class OtpPhoneInfo extends StatelessWidget {
  final String phoneNumber;
  const OtpPhoneInfo({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "ادخل رمز المرور المؤقت المرسل الى : ",
          style: AppTextStyle.textStyleBoldBlack,
        ),
        Text(
          phoneNumber,
          style: AppTextStyle.textStyleMediumGray,
        ),
      ],
    );
  }
}
