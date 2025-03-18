import 'package:get/get.dart';
import 'package:masajid/core/api/api_request.dart';
import 'package:masajid/features/services/model/services.dart';

class ServicesController extends GetxController{
  List<Services?>? services;
  bool isLoading=false;

  Future<void> readServices()async{
    services=await ApiRequestController().getServices();
    isLoading=true;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readServices();
  }
}