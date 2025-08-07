import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jomla_market/core/helper/assets_helper.dart';
import 'package:jomla_market/feature/create_account/view/widget/custom_empty_field.dart';
import 'package:jomla_market/feature/location/View/map_select_screen.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:jomla_market/core/utils/styles/app_sized_box.dart';
import 'package:jomla_market/core/utils/styles/app_text_style.dart';

// class OtherInfoStep extends StatelessWidget {
//   final TextEditingController addressController;
//   final TextEditingController phoneController;

//   const OtherInfoStep({
//     super.key,
//     required this.addressController,
//     required this.phoneController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 70,
//           width: MediaQuery.of(context).size.width,
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
//           decoration: BoxDecoration(
//             border: Border.all(color: AppColors.textGrayLight),
//             color: AppColors.white,
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(20),
//               bottomLeft: Radius.circular(20),
//               topRight: Radius.circular(0),
//               bottomRight: Radius.circular(20),
//             ),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(AppImages.locationLogo, height: 40, width: 40),
//               AppSizedBox.sizedW20,
//               const Text(
//                 "تعديل عنوان المنشأه",
//                 style: AppTextStyle.textStyleMediumGray,
//               ),
//             ],
//           ),
//         ),
//         AppSizedBox.sizedH15,
//         Row(
//           children: [
//             Expanded(child: _buildField("المدينة", addressController)),
//             AppSizedBox.sizedW15,
//             Expanded(child: _buildField("المنطقة", phoneController)),
//           ],
//         ),
//         AppSizedBox.sizedH20,
//         _buildField("اسم الشارع", phoneController),
//         AppSizedBox.sizedH20,
//         _buildField("رقم المبني ", phoneController),
//         AppSizedBox.sizedH20,
//         _buildField(" رقم هاتف المنشاة", phoneController),
//         AppSizedBox.sizedH20,
//         _buildField(" علامة مميزة (اختياري ", phoneController),
//         AppSizedBox.sizedH20,
//         _buildField("اسم المسؤول", phoneController),
//       ],
//     );
//   }

//   Widget _buildField(String label, TextEditingController controller) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: AppTextStyle.textStyleMediumGray.copyWith(fontSize: 18),
//         ),
//         AppSizedBox.sizedH10,
//         CustomRoundedTextField(
//           controller: controller,
//           readOnly: false,
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtherInfoStep extends StatelessWidget {
  final TextEditingController cityController;
  final TextEditingController areaController;
  final TextEditingController streetController;
  final TextEditingController buildingNumberController;
  final TextEditingController storePhoneController;
  final TextEditingController distinctiveMarkController;
  final TextEditingController responsibleNameController;

  const OtherInfoStep({
    super.key,
    required this.cityController,
    required this.areaController,
    required this.streetController,
    required this.buildingNumberController,
    required this.storePhoneController,
    required this.distinctiveMarkController,
    required this.responsibleNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   height: 70,
        //   width: MediaQuery.of(context).size.width,
        //   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        //   decoration: BoxDecoration(
        //     border: Border.all(color: AppColors.textGrayLight),
        //     color: AppColors.white,
        //     borderRadius: const BorderRadius.only(
        //       topLeft: Radius.circular(20),
        //       bottomLeft: Radius.circular(20),
        //       topRight: Radius.circular(0),
        //       bottomRight: Radius.circular(20),
        //     ),
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Image.asset(AppImages.locationLogo, height: 40, width: 40),
        //       AppSizedBox.sizedW20,
        //       const Text(
        //         "تعديل عنوان المنشأه",
        //         style: AppTextStyle.textStyleMediumGray,
        //       ),
        //     ],
        //   ),
        // ),

        GestureDetector(
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MapSelectScreen(),
              ),
            );
            if (result is Map<String, dynamic>) {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setDouble("latitude", result['lat']);
              await prefs.setDouble("longitude", result['lng']);
              print(
                  "تم حفظ اللوكيشن بنجاح: ${result['lat']} , ${result['lng']}");
            }
          },
          child: Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.textGrayLight),
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.locationLogo, height: 40, width: 40),
                AppSizedBox.sizedW20,
                const Text(
                  "تعديل عنوان المنشأه",
                  style: AppTextStyle.textStyleMediumGray,
                ),
              ],
            ),
          ),
        ),

        AppSizedBox.sizedH15,
        Row(
          children: [
            Expanded(child: _buildField("المدينة", cityController)),
            AppSizedBox.sizedW15,
            Expanded(child: _buildField("المنطقة", areaController)),
          ],
        ),
        AppSizedBox.sizedH20,
        _buildField("اسم الشارع", streetController),
        AppSizedBox.sizedH20,
        _buildField("رقم المبني ", buildingNumberController),
        AppSizedBox.sizedH20,
        _buildField(" رقم هاتف المنشاة", storePhoneController),
        AppSizedBox.sizedH20,
        _buildField(" علامة مميزة (اختياري)", distinctiveMarkController),
        AppSizedBox.sizedH20,
        _buildField("اسم المسؤول", responsibleNameController),
      ],
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.textStyleMediumGray.copyWith(fontSize: 18),
        ),
        AppSizedBox.sizedH10,
        CustomRoundedTextField(
          controller: controller,
          readOnly: false,
        ),
      ],
    );
  }
}
