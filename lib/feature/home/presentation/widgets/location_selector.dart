import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/resources/colors/colors.dart';

class LocationSelector extends StatefulWidget {
  const LocationSelector({super.key});

  @override
  State<LocationSelector> createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  String selectedCityRoute = 'مكة إلى الرياض';

  final List<String> cityRoutes = [
    'مكة إلى الرياض',
    'الرياض إلى مكة',
    'الرياض إلى جدة',
    'جدة إلى الرياض',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.local_shipping,
          color: AppColors.secondaryGreen,
          size: 30.sp,
        ),
        SizedBox(width: 10.w),
        Text(
          "التوصيل من :",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.sp),
        ),
        SizedBox(width: 20.w),
        DropdownButton<String>(
          value: selectedCityRoute,
          icon: const Icon(Icons.keyboard_arrow_down),
          underline: const SizedBox(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                selectedCityRoute = newValue;
              });
            }
          },
          items: cityRoutes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
