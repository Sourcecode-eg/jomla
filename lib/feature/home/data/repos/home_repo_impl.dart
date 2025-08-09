import 'package:jomla_market/feature/home/data/models/brand_model.dart';
import 'package:jomla_market/feature/home/data/models/category_model.dart';
import 'package:jomla_market/feature/home/data/models/offer_model.dart';
import 'package:jomla_market/feature/home/data/service/home_service.dart';
import 'package:jomla_market/feature/home/domain/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeService homeService;

  HomeRepoImpl({required this.homeService});

  @override
  Future<List<CategoryModel>> getAllCategories({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await homeService.getAllCategories(
        page: page,
        pageSize: pageSize,
      );
      final List data = response['data'];

      return data.map((category) => CategoryModel.fromJson(category)).toList();
    } catch (e) {
      throw ('Failed to load data: $e');
    }
  }

  @override
  Future<List<BrandModel>> getAllBrands({
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await homeService.getAllBrands(
        page: page,
        pageSize: pageSize,
      );
      final List data = response['data'];
      return data.map((brand) => BrandModel.fromJson(brand)).toList();
    } catch (e) {
      throw ('Failed to load data: $e');
    }
  }

  @override
  Future<List<OfferModel>> getAllOffers({
    int page = 1,
    int pageSize = 8,
  }) async {
    try {
      final response = await homeService.getAllOffers(
        page: page,
        pageSize: pageSize,
      );
      final List data = response['data'];
      return data.map((offer) => OfferModel.fromJson(offer)).toList();
    } catch (e) {
      throw ('Failed to load data: $e');
    }
  }
}
