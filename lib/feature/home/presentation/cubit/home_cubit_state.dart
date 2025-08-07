import 'package:jomla_market/feature/home/data/models/category_model.dart';

abstract class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeLoading extends HomeCubitState {}

final class HomeLoadedSuccess extends HomeCubitState {
  final List<CategoryModel> categories;

  HomeLoadedSuccess({required this.categories});
}

final class HomeFailure extends HomeCubitState {
  final String errMsg;

  HomeFailure({required this.errMsg});
}
