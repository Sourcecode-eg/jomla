import 'package:flutter/material.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';

class CustomStepper extends StatelessWidget {
  final int currentStep;

  const CustomStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final steps = ['بياناتك الشخصية', 'بيانات المنشأة', 'عنوان المنشأة'];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: List.generate(steps.length * 2 - 1, (index) {
            if (index.isOdd) {
              final leftStepIndex = (index - 1) ~/ 2;

              final isConnected = currentStep > leftStepIndex;
              return Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 3,
                    width: double.infinity,
                    color: isConnected ? Colors.green : Colors.grey,
                  ),
                ),
              );
            } else {
              final stepIndex = index ~/ 2;
              final isCompleted = currentStep > stepIndex;
              final isActive = currentStep == stepIndex;

              return Column(
                children: [
                  CircleAvatar(
                    radius: 24, // أكبر حجم
                    backgroundColor: isActive
                        ? Colors.green
                        : isCompleted
                            ? Colors.green
                            : Colors.white,
                    child: isActive || isCompleted
                        ? const Icon(Icons.check, size: 26, color: Colors.white)
                        : const Icon(Icons.circle_outlined,
                            size: 40, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    steps[stepIndex],
                    style: TextStyle(
                      fontWeight:
                          isActive ? FontWeight.bold : FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
