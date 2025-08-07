import 'package:flutter/material.dart';
import 'package:jomla_market/core/helper/toast_helper.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:pinput/pinput.dart';

class OTPInputWidget extends StatelessWidget {
  final TextEditingController otpController;
  final String? otpCode;
  final VoidCallback? onConfirm;

  const OTPInputWidget({
    Key? key,
    required this.otpController,
    required this.otpCode,
    this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 65,
      height: 65,
      textStyle: const TextStyle(
        fontSize: 22,
        color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
    );

    return Center(
      child: Pinput(
        length: 6,
        controller: otpController,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color.fromARGB(255, 3, 32, 56)),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.green),
          ),
        ),
        showCursor: true,
        onCompleted: (value) {
          if (otpCode != null && value == otpCode) {
            onConfirm?.call();
          } else {
            ToastHelper.showError(
              context: context,
              title: 'خطأ',
              description: 'الرمز غير صحيح',
            );
            otpController.clear();
          }
        },
      ),
    );
  }
}
