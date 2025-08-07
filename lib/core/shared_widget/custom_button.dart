import 'package:flutter/material.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:jomla_market/core/utils/styles/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;

  final Color buttonColor;
  final Color textColor;
  final Color iconBackgroundColor;
  final Color iconColor;

  final double? height;
  final double? width;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
    required this.buttonColor,
    required this.textColor,
    required this.iconBackgroundColor,
    this.iconColor = AppColors.red,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final buttonHeight = height ?? 50;
    final buttonWidth = width ?? deviceWidth * 0.9;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Spacer(flex: 2),
            Expanded(
              flex: 6,
              child: Center(
                child: Text(
                  text,
                  style: AppTextStyle.textStyleWhiteSemiBold.copyWith(
                    color: textColor,
                    fontSize: buttonHeight * 0.4,
                  ),
                ),
              ),
            ),
            Container(
              height: buttonHeight * 0.8,
              width: buttonHeight * 0.8,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                icon,
                size: 28,
                color: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
