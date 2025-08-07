import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:jomla_market/core/helper/toast_helper.dart';
import 'package:jomla_market/feature/otp/cubit/otp_cubit.dart';
import 'package:jomla_market/feature/otp/cubit/otp_state.dart';
import 'package:jomla_market/feature/otp/service/email_service.dart';
import 'package:jomla_market/feature/otp/service/otp_repository.dart';
import 'package:jomla_market/feature/otp/view/widget/otp_header.dart';
import 'package:jomla_market/feature/otp/view/widget/otp_input_widget.dart';
import 'package:jomla_market/feature/otp/view/widget/otp_phonr_info.dart';
import 'package:jomla_market/feature/otp/view/widget/resend_otp.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:jomla_market/core/utils/styles/app_sized_box.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String email;
  final VoidCallback? onVerified;
  final VoidCallback? onConfirm;

  const OtpScreen({
    super.key,
    required this.phoneNumber,
    required this.email,
    this.onVerified,
    this.onConfirm,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OtpCubit(
        otpRepository: OtpRepository(dio: Dio()),
        emailService: EmailService(
            senderEmail: 'grades1324@gmail.com',
            senderPassword: 'lexf dktd xhir vvar'),
      ),
      child: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state is OtpSuccess) {
            setState(() {
              otpCode = state.otp;
            });
            ToastHelper.showSuccess(
              context: context,
              title: 'نجاح',
              description: 'تم إرسال الرمز:',
            );
          } else if (state is OtpError) {
            ToastHelper.showError(
              context: context,
              title: 'خطأ',
              description: state.message,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.createAccScaffoldBackgroundColor,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const OtpHeader(),
                  AppSizedBox.sizedH15,
                  OtpPhoneInfo(phoneNumber: widget.phoneNumber),
                  AppSizedBox.sizedH10,
                  OTPInputWidget(
                    otpController: otpController,
                    otpCode: otpCode,
                    onConfirm: widget.onConfirm,
                  ),
                  AppSizedBox.sizedH20,
                  ResendOtpWidget(
                    isLoading: state is OtpLoading,
                    onResend: () {
                      context.read<OtpCubit>().sendOtp(
                            phoneNumber: widget.phoneNumber,
                            email: widget.email,
                          );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
