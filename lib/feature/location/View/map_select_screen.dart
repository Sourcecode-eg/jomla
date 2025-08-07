import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jomla_market/core/shared_widget/custom_appbar.dart';
import 'package:jomla_market/core/shared_widget/custom_button.dart';
import 'package:jomla_market/core/utils/colors/colors.dart';
import '../cubit/location_cubit.dart';
import '../cubit/location_state.dart';

class MapSelectScreen extends StatelessWidget {
  const MapSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LocationCubit>();
    final searchController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: const CustomAppBar(
        text: "عنوان المنشأة",
      ),
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: state.selectedLatLng,
                  zoom: 14,
                ),
                onMapCreated: cubit.setMapController,
                onCameraMove: (position) => cubit.updateCamera(position.target),
                myLocationEnabled: true,
              ),
              Positioned(
                top: 15,
                left: 12,
                right: 12,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: cubit.searchPlaces,
                        decoration: const InputDecoration(
                          hintText: 'ابحث عن مكان...',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none, // إزالة الخط التلقائي
                          contentPadding:
                              EdgeInsets.all(14), // المسافات الداخلية
                        ),
                      ),
                    ),
                    if (state.predictions.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.predictions.length,
                          itemBuilder: (_, index) {
                            final p = state.predictions[index];
                            return ListTile(
                              leading: const Icon(Icons.location_on),
                              title: Text(p.description ?? ''),
                              onTap: () => cubit.selectPlace(p.placeId ?? ''),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Icon(Icons.location_pin,
                    size: 40, color: Color(0xFF0288D1)),
              ),
              Positioned(
                bottom: 30,
                left: 20,
                right: 20,
                child: CustomButton(
                    text: "تاكيد الموقع",
                    onPressed: () => cubit.confirmLocation(context),
                    icon: Icons.navigate_next,
                    buttonColor: AppColors.green,
                    textColor: AppColors.white,
                    iconBackgroundColor: AppColors.white),
              ),
            ],
          );
        },
      ),
    );
  }
}
