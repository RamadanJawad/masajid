import 'package:get/get.dart';
import 'package:masajid/core/api/api_request.dart';
import 'package:masajid/features/gallery/model/gallery.dart';

class GalleryController extends GetxController{
  List<Gallery?>? gallery;
  bool isLoading=false;

  Future<void> readGallery()async{
    gallery=await ApiRequestController().getGallery();
    isLoading=true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    readGallery();
  }
}