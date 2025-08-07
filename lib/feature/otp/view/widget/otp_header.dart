import 'package:flutter/material.dart';
import 'package:jomla_market/core/utils/styles/app_text_style.dart';

class OtpHeader extends StatelessWidget {
  const OtpHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "رمز مرور لمره واحده",
      style: AppTextStyle.textStyleBoldBlack18,
    );
  }
}
