import 'package:flutter/material.dart';
import 'package:jomla_market/core/helper/app_responsive.dart';
import 'package:jomla_market/feature/home/presentation/views/home_view.dart';

class JomlaApp extends StatelessWidget {
  const JomlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppResponsive.init(
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'GE SS'),
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
