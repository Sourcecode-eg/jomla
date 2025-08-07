import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jomla_market/feature/auth_way/view/select_auth_way_view.dart';
import 'package:jomla_market/feature/create_account/cubit/create_account_cubit.dart';
import 'package:jomla_market/feature/location/cubit/location_cubit.dart';
import 'package:jomla_market/feature/login/cubit/login_cubit.dart';
import 'package:jomla_market/feature/login/data/login_repo.dart';
import 'package:jomla_market/feature/login/view/login_view.dart';
import 'package:jomla_market/feature/splash/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CreateAccountCubit(),
        ),
        BlocProvider(
          create: (_) => LocationCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          locale: const Locale('ar'),
          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            );
          },
          home: const SplashView()),
    );
  }
}
