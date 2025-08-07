import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpRepository {
  final Dio dio;

  OtpRepository({required this.dio});

  Future<String> sendOtp(String phoneNumber) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await dio.post(
      'http://41.38.56.140/GomlaAPI/api/Account/send-otp',
      data: {"phoneNumber": phoneNumber},
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200 && response.data['success'] == true) {
      return response.data['data'].toString();
    } else {
      throw Exception('فشل في إرسال رمز التحقق');
    }
  }
}
