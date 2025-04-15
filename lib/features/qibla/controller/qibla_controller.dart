import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class QiblaController extends GetxController with GetSingleTickerProviderStateMixin{
  Animation<double>? animation;
  AnimationController? animationController;
  double begin = 0.0;
  List<Placemark>? placemarks;
  final _locationStreamController =
  StreamController<LocationStatus>.broadcast();
  get stream => _locationStreamController.stream;

  Future<void> checkLocationStatus() async {
    placemarks=await placemarkFromCoordinates(35.78056000, -78.63890000);
    setLocaleIdentifier("en_US").then((_){
      update();
    });
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
      update();
    } else {
      _locationStreamController.sink.add(locationStatus);
    }
  }
  @override
  void onInit() {
    super.onInit();
    // checkLocationStatus();
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