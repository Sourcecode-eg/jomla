import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jomla_market/core/resources/images/images.dart';
import 'package:jomla_market/feature/home/data/models/offer_model.dart';
import 'package:jomla_market/feature/home/presentation/widgets/offer_card.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OfferModel> offers = [
      OfferModel(
        image: AppImages.offerItem,
        title: 'شيبسي',
        price: '10 ريال / قطعة',
      ),
      OfferModel(
        image: AppImages.biscuits,
        title: 'بسكويت',
        price: '15 ريال / قطعة',
      ),
      OfferModel(
        image: AppImages.offerItem,
        title: 'شيبسي',
        price: '10 ريال / قطعة',
      ),
      OfferModel(
        image: AppImages.biscuits,
        title: 'بسكويت',
        price: '15 ريال / قطعة',
      ),
      OfferModel(
        image: AppImages.offerItem,
        title: 'شيبسي',
        price: '10 ريال / قطعة',
      ),
    ];

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
