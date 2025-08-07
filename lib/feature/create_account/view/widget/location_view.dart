import 'package:flutter/material.dart';
import 'package:jomla_market/core/helper/network/api_constants.dart';
import 'package:jomla_market/feature/create_account/view/widget/custom_drob_box.dart';
import 'package:jomla_market/feature/create_account/view/widget/custom_empty_field.dart';
import 'package:jomla_market/core/utils/styles/app_sized_box.dart';
import 'package:jomla_market/core/utils/styles/app_text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationStep extends StatelessWidget {
  final TextEditingController storeNameArController;
  final TextEditingController storeTypeController;
  final TextEditingController representativeSerialController;
  final Function(int id, String name) onStoreTypeSelected;

  const LocationStep({
    Key? key,
    required this.storeNameArController,
    required this.storeTypeController,
    required this.representativeSerialController,
    required this.onStoreTypeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("بيانات المنشأة :",
            style: AppTextStyle.textStyleBoldBlack20),
        AppSizedBox.sizedH30,
        _buildField("اسم المنشأة (عربي)", storeNameArController),
        AppSizedBox.sizedH20,
        _buildField("الرقم التسلسلي للمندوب", representativeSerialController),
        AppSizedBox.sizedH20,
        const Text("اختر نوع المنشاة", style: AppTextStyle.textStyleMediumGray),
        AppSizedBox.sizedH10,
        CustomApiDropDownTextField(
          readOnly: true,
          controller: storeTypeController,
          label: "اختر نوع المنشاة",
          apiUrl: ApiContants.allBusinessTypes,
          onItemSelected: onStoreTypeSelected,
        ),
        AppSizedBox.sizedH15,
      ],
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.textStyleMediumGray),
        AppSizedBox.sizedH10,
        CustomRoundedTextField(
          controller: controller,
          readOnly: false,
          onChanged: (value) async {
            if (label == "الرقم التسلسلي للمندوب") {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('representativeSerial', value.trim());
              print("item saved in shred pref ");
            }
          },
        ),
      ],
    );
  }
}
