import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/feature/home/data/models/offer_model.dart';
import 'package:jomla_market/feature/home/presentation/widgets/home_view/offer_card.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({super.key, required this.offers});
  final List<OfferModel> offers;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: SizedBox(
        height: 210.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: offers.length,
          itemBuilder: (context, index) {
            return OfferCard(offer: offers[index], onAddToCart: () {});
          },
        ),
      ),
    );
  }
}
