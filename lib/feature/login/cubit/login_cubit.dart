import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jomla_market/feature/login/data/login_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repository;

  LoginCubit({required this.repository}) : super(LoginInitial());

  void validateAndLogin({
    required String phone,
    required String password,
  }) {
    if (phone.length < 11) {
      emit(LoginFailure('رقم الهاتف يجب أن يحتوي على 11 رقمًا على الأقل'));
    } else if (password.length < 8) {
      emit(LoginFailure('كلمة السر يجب أن تكون 8 أحرف أو أكثر'));
    } else {
      login(phoneNumber: phone, password: password);
    }
  }

  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final user = await repository.login(
        phoneNumber: phoneNumber,
        password: password,
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", user.token);
      await prefs.setString("storeId", user.userId.toString());

      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure('فشل تسجيل الدخول '));
    }
  }
}
