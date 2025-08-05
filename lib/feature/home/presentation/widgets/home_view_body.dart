import 'package:flutter/material.dart';
import 'package:jomla_market/feature/home/presentation/widgets/location_selector.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [LocationSelector()]);
  }
}
