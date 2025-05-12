import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class QiblaController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationController;
  double begin = 0.0;
  List<Placemark>? placemarks;
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();
  double? fixedQiblaAngle;

  void setQiblaAngle(double userLat, double userLng) {
    const double kaabaLat = 21.4225;
    const double kaabaLng = 39.8262;

    final latRad = userLat * pi / 180;
    final lngRad = userLng * pi / 180;
    const kaabaLatRad = kaabaLat * pi / 180;
    const kaabaLngRad = kaabaLng * pi / 180;

    final deltaLng = kaabaLngRad - lngRad;

    final x = sin(deltaLng);
    final y = cos(latRad) * tan(kaabaLatRad) - sin(latRad) * cos(deltaLng);

    final qiblaAngle = atan2(x, y) * 180 / pi;

    fixedQiblaAngle = (qiblaAngle + 360) % 360;
    update();
  }

  get stream => _locationStreamController.stream;

  Future<void> checkLocationStatus() async {
    try {
      final locationStatus = await FlutterQiblah.checkLocationStatus();

      if (!locationStatus.enabled ||
          locationStatus.status == LocationPermission.denied) {
        await FlutterQiblah.requestPermissions();
      }

      final updatedStatus = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(updatedStatus);

      if (updatedStatus.enabled &&
              updatedStatus.status == LocationPermission.always ||
          updatedStatus.status == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition();
        placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        setQiblaAngle(position.latitude, position.longitude);
        await setLocaleIdentifier("en_US");
      }

      update();
    } catch (e) {
      debugPrint("Location permission error: $e");
      _locationStreamController.sink.add(
        LocationStatus(false, LocationPermission.denied),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    animation = Tween(begin: 0.0, end: 0.0).animate(animationController!);
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    animationController?.dispose();
  }

  @override
  void onClose() {
    _locationStreamController.close();
    animationController?.dispose();
    super.onClose();
  }
}
