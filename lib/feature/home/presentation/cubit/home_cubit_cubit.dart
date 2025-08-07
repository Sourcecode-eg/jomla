import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jomla_market/feature/home/domain/repos/home_repo.dart';

import 'package:jomla_market/feature/home/presentation/cubit/home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit(this._homeRepo) : super(HomeCubitInitial());
  final HomeRepo _homeRepo;
  Future<void> getAllCategories() async {
    emit(HomeLoading());
    try {
      final categories = await _homeRepo.getAllCategories();
      emit(HomeLoadedSuccess(categories: categories));
    } catch (e) {
      emit(HomeFailure(errMsg: e.toString()));
    }
  }
}
