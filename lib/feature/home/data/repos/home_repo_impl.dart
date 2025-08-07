import 'package:jomla_market/feature/home/data/models/category_model.dart';
import 'package:jomla_market/feature/home/data/service/home_service.dart';
import 'package:jomla_market/feature/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeService homeService;

  HomeRepoImpl({required this.homeService});

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final response = await homeService.getAllCategories();
      final List data = response['data'];

      return data.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }
}
