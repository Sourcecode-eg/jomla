import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jomla_market/core/helper/app_responsive.dart';
import 'package:jomla_market/core/resources/colors/colors.dart';
import 'package:jomla_market/core/widgets/app_bar/custom_home_appbar.dart';
import 'package:jomla_market/core/widgets/bottom_nav/custom_bottom_nav_bar.dart';
import 'package:jomla_market/core/widgets/bottom_nav/custom_fab.dart';
import 'package:jomla_market/feature/sub_categories/presentation/view/sub_categories.dart';

class JomlaApp extends StatelessWidget {
  const JomlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppResponsive.init(
      child: MaterialApp(
        locale: const Locale('ar'),
        supportedLocales: const [Locale('ar')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          fontFamily: 'GE SS',
          scaffoldBackgroundColor: AppColors.backgroundGrey, // مهم جدًا للثيم العام
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          
          appBar: const CustomAppbar(),
          body: const SafeArea(child: SubCategories()),
          bottomNavigationBar: const CustomBottomNavBar(),
          floatingActionButton: const CustomFloatingActionButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
