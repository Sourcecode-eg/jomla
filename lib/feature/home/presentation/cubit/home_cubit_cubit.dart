import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jomla_market/feature/home/data/models/brand_model.dart';
import 'package:jomla_market/feature/home/data/models/category_model.dart';
import 'package:jomla_market/feature/home/data/models/offer_model.dart';
import 'package:jomla_market/feature/home/domain/repos/home_repo.dart';

import 'package:jomla_market/feature/home/presentation/cubit/home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit(this._homeRepo) : super(HomeCubitInitial());
  final HomeRepo _homeRepo;
  int _page = 1;
  final int _pageSize = 10;
  bool _isLoading = false;
  bool hasMore = true;

  List<BrandModel> brands = [];
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

  Future<void> getAllBrands() async {
    if (_isLoading || !hasMore) return;
    _isLoading = true;

    if (_page == 1) {
      emit(HomeLoading());
    }

    try {
      final newBrands = await _homeRepo.getAllBrands(
        page: _page,
        pageSize: _pageSize,
      );

      if (newBrands.isEmpty) {
        hasMore = false;
      } else {
        brands.addAll(newBrands);
        _page++;
        emit(BrandsLoadedSuccess(brands: List.from(brands)));
      }
    } catch (e) {
      emit(HomeFailure(errMsg: e.toString()));
    } finally {
      _isLoading = false;
    }
  }
}
