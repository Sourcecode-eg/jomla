// import 'dart:convert';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:jomla_market/core/constants/api_constants.dart';
// import 'package:jomla_market/feature/create_account/cubit/create_account_state.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CreateAccountCubit extends Cubit<CreateAccountState> {
//   CreateAccountCubit() : super(CreateAccountInitial());
//   Future<void> register({
//     required String userName,
//     required String fullName,
//     required String email,
//     required String phoneNumber,
//     required String password,
//     required String role,
//   }) async {
//     emit(CreateAccountLoading());

//     try {
//       final response = await Dio().post(
//         ApiContants.createAccount,
//         data: {
//           "UserName": userName,
//           "FullName": fullName,
//           "Email": email,
//           "PhoneNumber": phoneNumber,
//           "Password": password,
//           "Role": "Vendor",
//         },
//       );

//       if (response.statusCode == 200) {
//         final data = response.data["data"];

//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString("token", data["token"]);
//         await prefs.setString("userId", data["userId"]);
//         await prefs.setString("userName", data["userName"]);
//         await prefs.setString("email", data["email"]);
//         await prefs.setString("phoneNumber", data["phoneNumber"]);
//         print(response.data.toString());
//         emit(CreateAccountSuccess("Account created successfully"));
//       } else {
//         emit(CreateAccountFailure(
//             "Unexpected status code: ${response.statusCode}"));
//       }
//     } on DioException catch (e) {
//       final errorMsg = e.response?.data.toString() ?? e.message;
//       emit(CreateAccountFailure("Dio error: $errorMsg"));
//       print(errorMsg);
//     } catch (e) {
//       print(e.toString());
//       emit(CreateAccountFailure("Unexpected error: ${e.toString()}"));
//     }
//   }

//   Future<void> createStore({
//     required String nameAr,
//     required String nameEn,
//     required String registrtationNumber,
//     required String taxRegistrationNumber,
//     required String city,
//     required String state,
//     required String street,
//     required String buildingNumber,
//     required String businessNumber,
//     required String distinctiveMark,
//     required String administratorName,
//     required int businessTypeId,
//     required String businessTypeNameAr,
//     required String businessTypeNameEn,
//     required String representativeSerial,
//     required String ownerUserName,
//   }) async {
//     print("🔎 createStore() called");
//     emit(CreateStoreLoading());
//     print("📣 Emit: CreateStoreLoading");

//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       final appUserId = prefs.getString('userId');
//       final latitude = prefs.getDouble('latitude');
//       final longitude = prefs.getDouble('longitude');

//       print("🔐 Token: $token");
//       print("🌍 Latitude: $latitude");
//       print("🌍 Longitude: $longitude");
//       print("🧑‍💻 appUserId: $appUserId");

//       if (token == null || appUserId == null) {
//         print("❌ Missing token or userId");
//         emit(CreateStoreFailure("Authentication token or user ID not found."));
//         return;
//       }

//       // ✅ Create representative first
//       final repResponse =
//           await createRepresentative(serialNumber: representativeSerial);
//       if (repResponse == null) {
//         emit(CreateStoreFailure("فشل في إنشاء المندوب"));
//         return;
//       }

//       final representativeId = repResponse['id'];
//       final representativeSerialFromAPI = repResponse['serialNumber'];

//       final data = {
//         "id": 0,
//         "name_Ar": nameAr,
//         "name_En": nameEn,
//         "registrationNumber": registrtationNumber,
//         "taxRegistrationNumber": taxRegistrationNumber,
//         "city": city,
//         "state": state,
//         "street": street,
//         "buildingNumber": buildingNumber,
//         "businessNumber": businessNumber,
//         "distinctiveMark": distinctiveMark,
//         "administratorName": administratorName,
//         "latitude": latitude,
//         "longitude": longitude,
//         "location": "$latitude, $longitude",
//         "businessTypeId": businessTypeId,
//         "businessTypeName_Ar": businessTypeNameAr,
//         "businessTypeName_En": businessTypeNameEn,
//         "representativeId": representativeId,
//         "representativeSerial": representativeSerialFromAPI,
//         "appUserId": appUserId,
//         "ownerUserName": ownerUserName,
//       };

//       print("📦 Request Data:\n${jsonEncode(data)}");

//       final response = await Dio().post(
//         "http://41.38.56.140/GomlaAPI/api/Business/AddBusiness",
//         data: data,
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//             'Content-Type': 'application/json',
//           },
//         ),
//       );

//       print("📥 Response Status Code: ${response.statusCode}");
//       print("📥 Response Data: ${jsonEncode(response.data)}");

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         emit(CreateStoreSuccess("Store created successfully"));
//         print("📣 Emit: CreateStoreSuccess");
//       } else {
//         emit(CreateStoreFailure(
//             "Unexpected status code: ${response.statusCode}"));
//         print("📣 Emit: CreateStoreFailure - Unexpected status code");
//       }
//     } on DioException catch (e) {
//       final statusCode = e.response?.statusCode;
//       final responseData = e.response?.data;
//       final errorMsg = responseData?.toString() ?? e.message;

//       print("❗ DioException StatusCode: $statusCode");
//       print("❗ DioException Response: $responseData");
//       emit(CreateStoreFailure("Dio error: $errorMsg"));
//       print("📣 Emit: CreateStoreFailure - Dio error");
//     }
//   }

//   Future<void> getAllStoreTypes() async {
//     emit(GetStoreTypesLoading());

//     try {
//       final response = await Dio().get(
//         "http://41.38.56.140/Store.ApI/api/StoreTypes/GetAllTypes",
//         queryParameters: {
//           "page": 1,
//           "pageSize": 50,
//         },
//       );

//       if (response.statusCode == 200 && response.data['Success'] == true) {
//         final List data = response.data["Data"];
//         final storeTypes = data
//             .map<Map<String, dynamic>>((item) => {
//                   "id": int.tryParse(item["Id"].toString()),
//                   "name": item["Name_Ar"],
//                 })
//             .toList();

//         emit(GetStoreTypesSuccess(storeTypes));
//       } else {
//         emit(GetStoreTypesFailure("فشل في تحميل الأنواع"));
//       }
//     } catch (e) {
//       emit(GetStoreTypesFailure("خطأ في الاتصال بالسيرفر: ${e.toString()}"));
//     }
//   }

//   Future<Map<String, dynamic>?> createRepresentative({
//     required String serialNumber,
//   }) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final appUserId = prefs.getString('userId');
//       final token = prefs.getString('token');

//       if (appUserId == null || token == null) {
//         print("❌ Missing userId or token");
//         return null;
//       }

//       final data = {
//         "serialNumber": serialNumber,
//         "appUserId": appUserId,
//         "notes": "تم الإنشاء تلقائياً"
//       };

//       final response = await Dio().post(
//         "http://41.38.56.140/GomlaAPI/api/Representatives/CreateRepresentative",
//         data: data,
//         options: Options(headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         }),
//       );

//       if (response.statusCode == 200 && response.data['success'] == true) {
//         final repData = response.data['data'];
//         // 🧠 نحفظ ID و Serial
//         await prefs.setInt('representativeId', repData['id']);
//         await prefs.setString('representativeSerial', repData['serialNumber']);
//         print("✅ Representative created: ${repData.toString()}");
//         return repData;
//       } else {
//         print("❌ Failed to create representative: ${response.data}");
//         return null;
//       }
//     } catch (e) {
//       print("❗ Error creating representative: $e");
//       return null;
//     }
//   }
// }

import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:jomla_market/core/helper/network/api_constants.dart';
import 'package:jomla_market/feature/create_account/cubit/create_account_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  // Internal state for the cubit to manage the current step and OTP visibility
  int _currentStep = 0;
  bool _showOtp = false;

  // Data collected from previous steps, will be used for final store creation
  Map<String, dynamic>? _step2StoreData;

  CreateAccountCubit() : super(CreateAccountInitial()) {
    // Emit initial step state when the cubit is created
    _emitStepChangedState();
  }

  // Helper to get the app bar title based on current step and OTP visibility
  String _getAppBarTitle() {
    if (_showOtp) return 'تأكيد رقم الهاتف';
    switch (_currentStep) {
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

  // Helper to get the button text based on the current step
  String _getButtonText() {
    switch (_currentStep) {
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

  // Emits the CreateAccountStepChanged state with current step, OTP visibility, and texts
  void _emitStepChangedState() {
    emit(CreateAccountStepChanged(
      currentStep: _currentStep,
      showOtp: _showOtp,
      appBarTitle: _getAppBarTitle(),
      buttonText: _getButtonText(),
    ));
  }

  // Handles moving to the next step based on the current step's logic
  Future<void> nextStep({
    required String nameControllerText,
    required String phoneControllerText,
    required String emailControllerText,
    required String passwordControllerText,
    required String storeNameArControllerText,
    required String storeNameEnControllerText,
    required String registrationNumberControllerText,
    required String taxRegistrationNumberControllerText,
    required String storeTypeControllerText,
    required String cityControllerText,
    required String stateControllerText,
    required String streetControllerText,
    required String buildingNumberControllerText,
    required String storeNumberControllerText,
    required String distinctiveMarkControllerText,
    required String responsibleNameControllerText,
    required String representativeSerialControllerText,
    required int? selectedStoreTypeId,
  }) async {
    if (_showOtp) {
      // If OTP is currently shown, this button should not trigger next step logic directly.
      // OTP confirmation is handled by confirmOtpAndAdvance.
      return;
    }

    if (_currentStep == 0) {
      // Step 0: Register user
      await register(
        userName: nameControllerText.trim(),
        fullName: nameControllerText.trim(),
        email: emailControllerText.trim(),
        phoneNumber: phoneControllerText.trim(),
        password: passwordControllerText.trim(),
        role: 'User', // Assuming 'User' role for initial registration
      );
    } else if (_currentStep == 1) {
      // Step 1: Collect store info and move to next step
      _step2StoreData = {
        "name_Ar": storeNameArControllerText.trim(),
        "name_En": storeNameEnControllerText.trim(),
        "registrtationNumber": registrationNumberControllerText.trim(),
        "taxRegistrationNumber": taxRegistrationNumberControllerText.trim(),
        "businessType":
            storeTypeControllerText.trim(), // This is the name, not ID
        "city": cityControllerText.trim(),
        "state": stateControllerText.trim(),
        "street": streetControllerText.trim(),
        "buildingNumber": buildingNumberControllerText.trim(),
        "businessNumber": storeNumberControllerText.trim(),
        "distinctiveMark": distinctiveMarkControllerText.trim(),
        "adminstratorName": responsibleNameControllerText.trim(),
      };
      _currentStep++;
      _emitStepChangedState();
    } else if (_currentStep == 2) {
      // Step 2: Create store with all collected data
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userId') ?? '';

      final completeStoreData = {
        ..._step2StoreData!, // Use collected data from step 1
        "userId": userId,
        "city": cityControllerText.trim(),
        "state": stateControllerText.trim(),
        "street": streetControllerText.trim(),
        "buildingNumber": buildingNumberControllerText.trim(),
        "distinctiveMark": distinctiveMarkControllerText.trim(),
        "administratorName": responsibleNameControllerText.trim(),
        // Ensure these are passed correctly, if they are part of step 2's form
        "representativeSerial": representativeSerialControllerText.trim(),
        "businessTypeId": selectedStoreTypeId ?? 0,
        // The following are placeholders as they are not collected in the provided view
        "businessTypeNameAr": '',
        "businessTypeNameEn": '',
        "ownerUserName": '',
      };

      print("🚀 Sending complete store data: $completeStoreData");

      await createStore(
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
        businessNumber: completeStoreData["businessNumber"],
        businessTypeId: completeStoreData["businessTypeId"],
        businessTypeNameAr: completeStoreData["businessTypeNameAr"],
        businessTypeNameEn: completeStoreData["businessTypeNameEn"],
        representativeSerial: completeStoreData["representativeSerial"],
        ownerUserName: completeStoreData["ownerUserName"],
      );
    }
  }

  // Called when OTP is successfully confirmed
  void confirmOtpAndAdvance() {
    _showOtp = false;
    _currentStep++;
    _emitStepChangedState();
  }

  Future<void> register({
    required String userName,
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
    required String role,
  }) async {
    emit(CreateAccountLoading(message: "Registering account..."));

    try {
      final response = await Dio().post(
        ApiContants.createAccount,
        data: {
          "UserName": userName,
          "FullName": fullName,
          "Email": email,
          "PhoneNumber": phoneNumber,
          "Password": password,
          "Role": "Vendor", // Hardcoded as 'Vendor' as per original code
        },
      );

      if (response.statusCode == 200) {
        final data = response.data["data"];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", data["token"]);
        await prefs.setString("userId", data["userId"]);
        await prefs.setString("userName", data["userName"]);
        await prefs.setString("email", data["email"]);
        await prefs.setString("phoneNumber", data["phoneNumber"]);
        print(response.data.toString());
        emit(CreateAccountSuccess("Account created successfully"));
        _showOtp = true;
        emit(CreateAccountShowOtp(phoneNumber: phoneNumber, email: email));
      } else {
        emit(CreateAccountFailure(
            "Unexpected status code: ${response.statusCode}"));
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data.toString() ?? e.message;
      emit(CreateAccountFailure("Dio error: $errorMsg"));
      print(errorMsg);
    } catch (e) {
      print(e.toString());
      emit(CreateAccountFailure("Unexpected error: ${e.toString()}"));
    }
  }

  Future<void> createStore({
    required String nameAr,
    required String nameEn,
    required String registrtationNumber,
    required String taxRegistrationNumber,
    required String city,
    required String state,
    required String street,
    required String buildingNumber,
    required String businessNumber,
    required String distinctiveMark,
    required String administratorName,
    required int businessTypeId,
    required String businessTypeNameAr,
    required String businessTypeNameEn,
    required String representativeSerial,
    required String ownerUserName,
  }) async {
    print("🔎 createStore() called");
    emit(CreateStoreLoading());
    print("📣 Emit: CreateStoreLoading");

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final appUserId = prefs.getString('userId');
      final latitude = prefs.getDouble('latitude');
      final longitude = prefs.getDouble('longitude');

      print("🔐 Token: $token");
      print("🌍 Latitude: $latitude");
      print("🌍 Longitude: $longitude");
      print("🧑‍💻 appUserId: $appUserId");

      if (token == null || appUserId == null) {
        print("❌ Missing token or userId");
        emit(CreateStoreFailure("Authentication token or user ID not found."));
        return;
      }

      // ✅ Create representative first
      final repResponse =
          await createRepresentative(serialNumber: representativeSerial);
      if (repResponse == null) {
        emit(CreateStoreFailure("فشل في إنشاء المندوب"));
        return;
      }

      final representativeId = repResponse['id'];
      final representativeSerialFromAPI = repResponse['serialNumber'];

      final data = {
        "id": 0,
        "name_Ar": nameAr,
        "name_En": nameEn,
        "registrationNumber": registrtationNumber,
        "taxRegistrationNumber": taxRegistrationNumber,
        "city": city,
        "state": state,
        "street": street,
        "buildingNumber": buildingNumber,
        "businessNumber": businessNumber,
        "distinctiveMark": distinctiveMark,
        "administratorName": administratorName,
        "latitude": latitude,
        "longitude": longitude,
        "location": "$latitude, $longitude",
        "businessTypeId": businessTypeId,
        "businessTypeName_Ar": businessTypeNameAr,
        "businessTypeName_En": businessTypeNameEn,
        "representativeId": representativeId,
        "representativeSerial": representativeSerialFromAPI,
        "appUserId": appUserId,
        "ownerUserName": ownerUserName,
      };

      print("📦 Request Data:\n${jsonEncode(data)}");

      final response = await Dio().post(
        "http://41.38.56.140/GomlaAPI/api/Business/AddBusiness",
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      print("📥 Response Status Code: ${response.statusCode}");
      print("📥 Response Data: ${jsonEncode(response.data)}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(CreateStoreSuccess("Store created successfully"));
        print("📣 Emit: CreateStoreSuccess");
      } else {
        emit(CreateStoreFailure(
            "Unexpected status code: ${response.statusCode}"));
        print("📣 Emit: CreateStoreFailure - Unexpected status code");
      }
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final responseData = e.response?.data;
      final errorMsg = responseData?.toString() ?? e.message;

      print("❗ DioException StatusCode: $statusCode");
      print("❗ DioException Response: $responseData");
      emit(CreateStoreFailure("Dio error: $errorMsg"));
      print("📣 Emit: CreateStoreFailure - Dio error");
    }
  }

  Future<void> getAllStoreTypes() async {
    emit(GetStoreTypesLoading());

    try {
      final response = await Dio().get(
        "http://41.38.56.140/Store.ApI/api/StoreTypes/GetAllTypes",
        queryParameters: {
          "page": 1,
          "pageSize": 50,
        },
      );

      if (response.statusCode == 200 && response.data['Success'] == true) {
        final List data = response.data["Data"];
        final storeTypes = data
            .map<Map<String, dynamic>>((item) => {
                  "id": int.tryParse(item["Id"].toString()),
                  "name": item["Name_Ar"],
                })
            .toList();

        emit(GetStoreTypesSuccess(storeTypes));
      } else {
        emit(GetStoreTypesFailure("فشل في تحميل الأنواع"));
      }
    } catch (e) {
      emit(GetStoreTypesFailure("خطأ في الاتصال بالسيرفر: ${e.toString()}"));
    }
  }

  Future<Map<String, dynamic>?> createRepresentative({
    required String serialNumber,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final appUserId = prefs.getString('userId');
      final token = prefs.getString('token');

      if (appUserId == null || token == null) {
        print("❌ Missing userId or token");
        return null;
      }

      final data = {
        "serialNumber": serialNumber,
        "appUserId": appUserId,
        "notes": "تم الإنشاء تلقائياً"
      };

      final response = await Dio().post(
        "http://41.38.56.140/GomlaAPI/api/Representatives/CreateRepresentative",
        data: data,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        final repData = response.data['data'];
        await prefs.setInt('representativeId', repData['id']);
        await prefs.setString('representativeSerial', repData['serialNumber']);
        print("✅ Representative created: ${repData.toString()}");
        return repData;
      } else {
        print("❌ Failed to create representative: ${response.data}");
        return null;
      }
    } catch (e) {
      print("❗ Error creating representative: $e");
      return null;
    }
  }
}
