import 'package:dio/dio.dart';
import 'package:jomla_market/feature/login/model/user_model.dart';
import 'package:jomla_market/core/helper/network/api_constants.dart';

class LoginRepository {
  final Dio dio;

  LoginRepository({required this.dio});

  Future<UserModel> login({
    required String phoneNumber,
    required String password,
  }) async {
    final response = await dio.post(
      ApiContants.login,
      data: {
        "phoneNumber": phoneNumber,
        "Password": password,
      },
    );

    if (response.statusCode == 200 && response.data != null) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception('فشل تسجيل الدخول');
    }
  }
}
