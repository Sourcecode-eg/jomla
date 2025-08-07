import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:jomla_market/feature/create_account/view/widget/custom_drob_box.dart';
import 'package:jomla_market/feature/create_account/view/widget/custom_empty_field.dart';
import 'package:jomla_market/feature/create_account/view/widget/custom_image_container_filed.dart';
import 'package:jomla_market/feature/create_account/view/widget/static_drob.dart';
import 'package:jomla_market/core/utils/styles/app_sized_box.dart';
import 'package:jomla_market/core/utils/styles/app_text_style.dart';

class PersonalInfoStep extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const PersonalInfoStep({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("بياناتك الشخصيه :",
            style: AppTextStyle.textStyleBoldBlack18),
        AppSizedBox.sizedH10,
        _buildLabeledField("الاسم بالكامل", nameController),
        AppSizedBox.sizedH15,
        _buildLabeledField("رقم الهاتف", phoneController),
        AppSizedBox.sizedH15,
        _buildLabeledField("البريد الإلكتروني", emailController),
        AppSizedBox.sizedH15,
        _buildLabeledField("كلمة المرور", passwordController),
      ],
    );
  }

  Widget _buildLabeledField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.textStyleMediumGray),
        AppSizedBox.sizedH10,
        CustomRoundedTextField(
          controller: controller,
          readOnly: false,
        ),
      ],
    );
  }
}
