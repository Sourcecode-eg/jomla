import 'package:dio/dio.dart';

class CreateAccountRepository {
  final Dio _dio;

  CreateAccountRepository(this._dio);

  Future<Map<String, dynamic>> register(Map<String, dynamic> userData) async {
    final response = await _dio.post(
      "http://41.38.56.140/GomlaAPI/api/Account/Register",
      data: userData,
    );
    return response.data;
  }

  Future<Map<String, dynamic>?> createRepresentative(
      Map<String, dynamic> data, String token) async {
    final response = await _dio.post(
      "http://41.38.56.140/GomlaAPI/api/Representatives/CreateRepresentative",
      data: data,
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      }),
    );

    if (response.statusCode == 200 && response.data['success'] == true) {
      return response.data['data'];
    }
    return null;
  }

  Future<Map<String, dynamic>> createStore(
      Map<String, dynamic> storeData, String token) async {
    final response = await _dio.post(
      "http://41.38.56.140/GomlaAPI/api/Business/AddBusiness",
      data: storeData,
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      }),
    );
    return response.data;
  }

  Future<List<Map<String, dynamic>>> getAllStoreTypes() async {
    final response = await _dio.get(
      "http://41.38.56.140/Store.ApI/api/StoreTypes/GetAllTypes",
      queryParameters: {"page": 1, "pageSize": 50},
    );

    final List data = response.data["Data"];
    return data.map<Map<String, dynamic>>((item) {
      return {
        "id": int.tryParse(item["Id"].toString()),
        "name": item["Name_Ar"],
      };
    }).toList();
  }
}
