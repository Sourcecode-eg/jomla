// import 'package:flutter/material.dart';
// import 'package:jomla_market/core/widget/custom_appbar.dart';

// class SelectCountrView extends StatelessWidget {
//   const SelectCountrView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       appBar: CustomAppBar(text: "اختار المدنية"),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';

class CitySelector extends StatefulWidget {
  const CitySelector({super.key});

  @override
  State<CitySelector> createState() => _CitySelectorState();
}

class _CitySelectorState extends State<CitySelector> {
  String? selectedCity;

  final List<String> cities = ['الرياض', 'جدة', 'مكة'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.createAccScaffoldBackgroundColor,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'اختر المدينة',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ...cities.map((city) {
                return Column(
                  children: [
                    RadioListTile<String>(
                      value: city,
                      groupValue: selectedCity,
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                        });
                      },
                      title: Text(
                        city,
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontSize: 16),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                    const Divider(height: 1),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
