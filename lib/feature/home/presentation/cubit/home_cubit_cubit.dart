import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jomla_market/feature/home/data/models/brand_model.dart';
import 'package:jomla_market/feature/home/data/models/category_model.dart';
import 'package:jomla_market/feature/home/data/models/offer_model.dart';
import 'package:jomla_market/feature/home/domain/repos/home_repo.dart';

import 'package:jomla_market/feature/home/presentation/cubit/home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit(this._homeRepo) : super(HomeCubitInitial());
  final HomeRepo _homeRepo;
  Future<void> getHomeData() async {
    emit(HomeLoading());
    try {
      final data = await Future.wait([
        _homeRepo.getAllBrands(),
        _homeRepo.getAllCategories(),
        _homeRepo.getAllOffers(),
      ]);
      final brands = data[0] as List<BrandModel>;
      final categories = data[1] as List<CategoryModel>;
      final offers = data[2] as List<OfferModel>;
      emit(
        HomeLoadedSuccess(
          categories: categories,
          brands: brands,
          offers: offers,
        ),
      );
    } catch (e) {
      emit(HomeFailure(errMsg: e.toString()));
    }
  }
}
