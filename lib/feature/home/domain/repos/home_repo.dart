import 'package:jomla_market/feature/home/data/models/category_model.dart';

abstract class HomeRepo {
  Future<List<CategoryModel>> getAllCategories();
}
