import 'package:jomla_market/feature/home/data/models/brand_model.dart';
import 'package:jomla_market/feature/home/data/models/category_model.dart';
import 'package:jomla_market/feature/home/data/models/offer_model.dart';

abstract class HomeRepo {
  Future<List<CategoryModel>> getAllCategories();
  Future<List<BrandModel>> getAllBrands();
  Future<List<OfferModel>> getAllOffers();
}
