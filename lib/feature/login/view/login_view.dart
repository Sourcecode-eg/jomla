import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jomla_market/core/helper/navigation_helper.dart';
import 'package:jomla_market/core/helper/toast_helper.dart';
import 'package:jomla_market/core/shared_widget/custom_button.dart';
import 'package:jomla_market/feature/create_account/view/create_acc_view.dart';
import 'package:jomla_market/feature/login/cubit/login_cubit.dart';
import 'package:jomla_market/feature/login/cubit/login_state.dart';
import 'package:jomla_market/feature/login/data/login_repo.dart';
import 'package:jomla_market/feature/login/view/widget/forget_pass_button.dart';
import 'package:jomla_market/feature/login/view/widget/login_header.dart';
import 'package:jomla_market/feature/login/view/widget/password_input_field.dart';
import 'package:jomla_market/feature/login/view/widget/phone_input_field.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:jomla_market/core/utils/styles/app_sized_box.dart';
import 'package:jomla_market/core/utils/styles/app_text_style.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(repository: LoginRepository(dio: Dio())),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ToastHelper.showSuccess(
                context: context,
                title: 'مرحبًا ${state.user.userName}',
                description: "تم تسجيل دخولك بنجاح",
              );
            } else if (state is LoginFailure) {
              ToastHelper.showError(
                context: context,
                title: 'خطا',
                description: state.error,
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LoginHeader(),
                  const Text(
                    "تسجيل الدخول",
                    style: AppTextStyle.textStyleBoldBlack20,
                  ),
                  AppSizedBox.sizedH15,
                  PhoneTextField(controller: _phoneController),
                  AppSizedBox.sizedH10,
                  PasswordTextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    onToggle: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                  const ForgotPasswordButton(),
                  AppSizedBox.sizedH10,
                  if (state is LoginLoading)
                    const CircularProgressIndicator()
                  else
                    CustomButton(
                      text: "تسجيل الدخول",
                      icon: Icons.navigate_next,
                      onPressed: () {
                        final phone = _phoneController.text.trim();
                        final password = _passwordController.text.trim();
                        context.read<LoginCubit>().validateAndLogin(
                              phone: phone,
                              password: password,
                            );
                      },
                      buttonColor: AppColors.green,
                      textColor: AppColors.white,
                      iconBackgroundColor: AppColors.white,
                    ),
                  AppSizedBox.sizedH15,
                  GestureDetector(
                    onTap: () => navigateTo(context, const CreateAccountView()),
                    child: const Text(
                      "إنشاء حساب",
                      style: AppTextStyle.textStyleBoldBlack,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
