import 'package:flutter/material.dart';
import 'package:jomla_market/core/utils/styles/app_sized_box.dart';
import 'package:jomla_market/core/utils/styles/app_text_style.dart';

class ResendOtpWidget extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onResend;

  const ResendOtpWidget({
    Key? key,
    required this.isLoading,
    required this.onResend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "لم يصلك الرمز؟",
            style: AppTextStyle.textStyleBoldBlack,
          ),
          AppSizedBox.sizedW10,
          GestureDetector(
            onTap: isLoading ? null : onResend,
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text(
                    " إعادة إرسال OTP",
                    style: AppTextStyle.textStyleSemiBoldRed,
                  ),
          ),
        ],
      ),
    );
  }
}
