import 'package:dio/dio.dart';
import 'package:jomla_market/core/helper/network/api_constants.dart';

class HomeService {
  final Dio dio;

  HomeService({required this.dio});
  Future<Map<String, dynamic>> getAllCategories({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await dio.get(
        ApiConstants.getAllCategories,
        queryParameters: {'pageNumber': page, 'pageSize': pageSize},
      );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getAllBrands({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await dio.get(
        ApiConstants.getAllBrands,
        queryParameters: {'pageNumber': page, 'pageSize': pageSize},
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getAllOffers({
    int page = 1,
    int pageSize = 8,
  }) async {
    try {
      final response = await dio.get(
        ApiConstants.getAllOffers,
        queryParameters: {'pageNumber': page, 'pageSize': pageSize},
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
