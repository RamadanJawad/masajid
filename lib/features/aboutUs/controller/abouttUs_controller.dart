import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masajid/core/api/api_request.dart';
import 'package:masajid/features/aboutUs/model/about.dart';

class AboutUsController extends GetxController{
  bool isLoading = false;
  About? about;

  Future<void> getDataAbout()async{
    about=await ApiRequestController().getAbout();
    isLoading=true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getDataAbout();
  }
}