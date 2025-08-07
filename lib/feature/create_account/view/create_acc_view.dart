

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jomla_market/core/shared_widget/custom_appbar.dart';
import 'package:jomla_market/core/shared_widget/custom_button.dart';
import 'package:jomla_market/feature/create_account/cubit/create_account_cubit.dart';
import 'package:jomla_market/feature/create_account/cubit/create_account_state.dart';
import 'package:jomla_market/feature/create_account/view/widget/location_view.dart';
import 'package:jomla_market/feature/create_account/view/widget/other_info_step.dart';
import 'package:jomla_market/feature/create_account/view/widget/personal-info_view.dart';
import 'package:jomla_market/feature/create_account/view/widget/steper.dart';
import 'package:jomla_market/feature/otp/view/otp_screen.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  int currentStep = 0;
  bool showOtp = false;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final storeTypeController = TextEditingController();
  final storeDescriptionController = TextEditingController();
  final addressController = TextEditingController();
  final storePhoneController = TextEditingController();

  final storeStatusController = TextEditingController();
  final hasOfferController = TextEditingController();
  final offerValueController = TextEditingController();
  final storeNameArController = TextEditingController();
  final storeNameEnController = TextEditingController();
  final registrationNumberController = TextEditingController();
  final taxRegistrationNumberController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final streetController = TextEditingController();
  final buildingNumberController = TextEditingController();
  final storeNumberController = TextEditingController();
  final distinctiveMarkController = TextEditingController();
  final responsibleNameController = TextEditingController();
  final areaController = TextEditingController();
  final representativeSerialController = TextEditingController();  

  bool? hasOfferSelected;

  String? storeImageBase64;
  String? storeIconBase64;
  int? selectedStoreTypeId;
  Map<String, dynamic>? step2StoreData;

  String getAppBarTitle() {
    if (showOtp) return 'تأكيد رقم الهاتف';
    switch (currentStep) {
      case 0:
        return 'المعلومات الشخصية';
      case 1:
        return 'معلومات المتجر';
      case 2:
        return 'معلومات إضافية';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateAccountCubit, CreateAccountState>(
      listener: (context, state) {
        if (state is CreateAccountLoading || state is CreateStoreLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is CreateAccountSuccess) {
          Navigator.pop(context);
          setState(() => showOtp = true);
        } else if (state is CreateStoreSuccess) {
          Navigator.pop(context);
        } else if (state is CreateAccountFailure ||
            state is CreateStoreFailure) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          text: getAppBarTitle(),
        ),
        backgroundColor: AppColors.createAccScaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomStepper(currentStep: currentStep),
              ),
              Expanded(
                child: showOtp
                    ? OtpScreen(
                        onConfirm: () {
                          setState(() {
                            showOtp = false;
                            currentStep++;
                          });
                        },
                        phoneNumber: phoneController.text,
                        email: emailController.text,
                      )
                    : SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: getStepContent(),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButton(
                  onPressed: handleNextStep,
                  text: getButtonText(currentStep),
                  textColor: AppColors.white,
                  icon: Icons.navigate_next,
                  buttonColor: AppColors.green,
                  iconBackgroundColor: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getButtonText(int step) {
    switch (step) {
      case 0:
        return 'تأكيد رقم الهاتف';
      case 1:
        return 'استمرار';
      case 2:
        return 'حفظ العنوان وانهاء';
      default:
        return 'التالي';
    }
  }

  void handleNextStep() async {
    final cubit = context.read<CreateAccountCubit>();

    if (currentStep == 0 && !showOtp) {
      cubit.register(
        userName: nameController.text.trim(),
        fullName: nameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        password: passwordController.text.trim(),
        role: 'User',
      );
    } else if (currentStep == 1) {
      step2StoreData = {
        "name_Ar": storeNameArController.text.trim(),
        "name_En": storeNameEnController.text.trim(),
        "registrtationNumber": registrationNumberController.text.trim(),
        "taxRegistrationNumber": taxRegistrationNumberController.text.trim(),
        "businessType": storeTypeController.text.trim(),
        "city": cityController.text.trim(),
        "state": stateController.text.trim(),
        "street": streetController.text.trim(),
        "buildingNumber": buildingNumberController.text.trim(),
        "businessNumber": storeNumberController.text.trim(),
        "distinctiveMark": distinctiveMarkController.text.trim(),
        "adminstratorName": responsibleNameController.text.trim(),
      };
      setState(() => currentStep++);
    } else if (currentStep == 2) {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId') ?? '';

      final completeStoreData = {
        ...step2StoreData!,
        "userId": userId,
        "city": cityController.text.trim(),
        "state": stateController.text.trim(),
        "street": streetController.text.trim(),
        "buildingNumber": buildingNumberController.text.trim(),
        "distinctiveMark": distinctiveMarkController.text.trim(),
        "administratorName": responsibleNameController.text.trim(),
      };

      print("🚀 Sending store data: $completeStoreData");

      cubit.createStore(
        nameAr: completeStoreData["name_Ar"],
        nameEn: completeStoreData["name_En"],
        registrtationNumber: completeStoreData["registrtationNumber"],
        taxRegistrationNumber: completeStoreData["taxRegistrationNumber"],
        city: completeStoreData["city"],
        state: completeStoreData["state"],
        street: completeStoreData["street"],
        buildingNumber: completeStoreData["buildingNumber"],
        distinctiveMark: completeStoreData["distinctiveMark"],
        administratorName: completeStoreData["administratorName"],
        businessNumber: '',
        businessTypeId: selectedStoreTypeId ?? 0,
        businessTypeNameAr: '',
        businessTypeNameEn: '',
        representativeSerial: '',
        ownerUserName: '',
      );
    }
  }

  Widget getStepContent() {
    switch (currentStep) {
      case 0:
        return PersonalInfoStep(
          nameController: nameController,
          phoneController: phoneController,
          emailController: emailController,
          passwordController: passwordController,
        );
      case 1:
        return LocationStep(
          storeTypeController: storeTypeController,
          storeNameArController: storeNameArController,
           onStoreTypeSelected: (int id, String name) {
            selectedStoreTypeId = id;
            storeTypeController.text = name;
          },
          representativeSerialController: representativeSerialController,
        );
      case 2:
        return OtherInfoStep(
          cityController: cityController,
          areaController: areaController,
          streetController: streetController,
          buildingNumberController: buildingNumberController,
          storePhoneController: storePhoneController,
          distinctiveMarkController: distinctiveMarkController,
          responsibleNameController: responsibleNameController,
        );

      default:
        return const SizedBox();
    }
  }
}
