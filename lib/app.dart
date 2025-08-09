import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jomla_market/core/helper/app_responsive.dart';
import 'package:jomla_market/feature/home/data/repos/home_repo_impl.dart';
import 'package:jomla_market/feature/home/data/service/home_service.dart';
import 'package:jomla_market/feature/home/presentation/cubit/home_cubit_cubit.dart';
import 'package:jomla_market/feature/home/presentation/views/category_view.dart';

class JomlaApp extends StatelessWidget {
  const JomlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppResponsive.init(
      child: MaterialApp(
        locale: const Locale('ar'),
        supportedLocales: const [Locale('ar')],
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        theme: ThemeData(fontFamily: 'GE SS'),
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) =>
              HomeCubit(HomeRepoImpl(homeService: HomeService(dio: Dio()))),
          child: const CategoryView(),
        ),
      ),
    );
  }
}
