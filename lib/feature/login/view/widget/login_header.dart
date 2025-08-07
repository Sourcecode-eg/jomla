import 'package:flutter/material.dart';
import 'package:jomla_market/core/helper/assets_helper.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.appLogo,
      height: 300,
    );
  }
}
