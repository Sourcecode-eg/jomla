import 'package:jomla_market/feature/home/data/models/brand_model.dart';
import 'package:jomla_market/feature/home/data/models/category_model.dart';
import 'package:jomla_market/feature/home/data/models/offer_model.dart';

abstract class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeLoading extends HomeCubitState {}

final class HomeLoadedSuccess extends HomeCubitState {
  final List<CategoryModel> categories;
  final List<BrandModel> brands;
  final List<OfferModel> offers;

  HomeLoadedSuccess({
    required this.categories,
    required this.brands,
    required this.offers,
  });
}

final class BrandsLoadedSuccess extends HomeCubitState {
  final List<BrandModel> brands;

  BrandsLoadedSuccess({required this.brands});
}

final class HomeFailure extends HomeCubitState {
  final String errMsg;

  HomeFailure({required this.errMsg});
}
