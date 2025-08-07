import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jomla_market/core/helper/network/api_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'location_state.dart';

class Prediction {
  final String? description;
  final String? placeId;

  Prediction({this.description, this.placeId});
}

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationState());

  final Dio _dio = Dio();
  final Completer<GoogleMapController> _mapController = Completer();
  List<Prediction> predictions = [];

  GoogleMapController? get controller => _mapController.isCompleted
      ? _mapController.future as GoogleMapController
      : null;

  void setMapController(GoogleMapController controller) {
    if (!_mapController.isCompleted) _mapController.complete(controller);
  }

  Future<void> getCurrentLocation(BuildContext context) async {
    print("📍 طلب الموقع الحالي...");
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("يرجى تفعيل إذن الموقع")),
        );
        return;
      }
    }

    final pos = await Geolocator.getCurrentPosition();
    final latLng = LatLng(pos.latitude, pos.longitude);
    emit(state.copyWith(selectedLatLng: latLng));
    moveCamera(latLng);
  }

  Future<void> moveCamera(LatLng latLng) async {
    final controller = await _mapController.future;
    await controller.animateCamera(CameraUpdate.newLatLng(latLng));
    emit(state.copyWith(selectedLatLng: latLng));
  }

  Future<void> searchPlaces(String input) async {
    if (input.isEmpty) {
      predictions = [];
      emit(state.copyWith(predictions: predictions));
      return;
    }
    // const String kGoogleApiKey = 'AIzaSyCULgpAHLJ4mlKCU-FLS2SffXRMDH2JNGg';

    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=AIzaSyCULgpAHLJ4mlKCU-FLS2SffXRMDH2JNGg&language=ar';

    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200 && response.data['status'] == 'OK') {
        final predictionsJson = response.data['predictions'] as List;
        predictions = predictionsJson
            .map((e) => Prediction(
                  description: e['description'],
                  placeId: e['place_id'],
                ))
            .toList();
        emit(state.copyWith(predictions: predictions));
      }
    } catch (e) {
      debugPrint("❌ Autocomplete error: $e");
    }
  }

  Future<void> selectPlace(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=AIzaSyCULgpAHLJ4mlKCU-FLS2SffXRMDH2JNGg&language=ar';

    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200 && response.data['status'] == 'OK') {
        final result = response.data['result'];
        final loc = result['geometry']['location'];
        final latLng = LatLng(loc['lat'], loc['lng']);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setDouble('latitude', latLng.latitude);
        await prefs.setDouble('longitude', latLng.longitude);
        moveCamera(latLng);
        predictions.clear();
        emit(state.copyWith(selectedLatLng: latLng, predictions: []));
      }
    } catch (e) {
      debugPrint("❌ Place details error: $e");
    }
  }

  Future<void> confirmLocation(BuildContext context) async {
    final latLng = state.selectedLatLng;
    print("🟡 تأكيد الموقع...");
    print("Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}");

    final address = await _getAddressFromLatLng(latLng);
    emit(state.copyWith(address: address));
    print("📌 العنوان: $address");

    Navigator.pop(context);
  }

  Future<String> _getAddressFromLatLng(LatLng latLng) async {
    final url =
        'https://nominatim.openstreetmap.org/reverse?lat=${latLng.latitude}&lon=${latLng.longitude}&format=json';

    try {
      final response = await _dio.get(url,
          options: Options(headers: {'User-Agent': 'FlutterApp'}));

      if (response.statusCode == 200) {
        final data = response.data;
        return data['display_name'] ?? "عنوان غير معروف";
      } else {
        return "فشل في جلب العنوان";
      }
    } catch (e) {
      debugPrint("❌ Reverse geocoding error: $e");
      return "حدث خطأ أثناء جلب العنوان";
    }
  }

  void updateCamera(LatLng latLng) {
    emit(state.copyWith(selectedLatLng: latLng));
  }
}
