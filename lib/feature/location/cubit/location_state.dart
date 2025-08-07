// class LocationState {
//   final double? latitude;
//   final double? longitude;
//   final String? address;

//   const LocationState({
//     this.latitude,
//     this.longitude,
//     this.address,
//   });

//   LocationState copyWith({
//     double? latitude,
//     double? longitude,
//     String? address,
//   }) {
//     return LocationState(
//       latitude: latitude ?? this.latitude,
//       longitude: longitude ?? this.longitude,
//       address: address ?? this.address,
//     );
//   }

//   bool get isComplete => latitude != null && longitude != null;
// }
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'location_cubit.dart';

class LocationState extends Equatable {
  final LatLng selectedLatLng;
  final String address;
  final List<Prediction> predictions;

  const LocationState({
    this.selectedLatLng = const LatLng(30.033333, 31.233334),
    this.address = '',
    this.predictions = const [],
  });

  LocationState copyWith({
    LatLng? selectedLatLng,
    String? address,
    List<Prediction>? predictions,
  }) {
    return LocationState(
      selectedLatLng: selectedLatLng ?? this.selectedLatLng,
      address: address ?? this.address,
      predictions: predictions ?? this.predictions,
    );
  }

  @override
  List<Object?> get props => [selectedLatLng, address, predictions];
}
