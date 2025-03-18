import 'package:get/get.dart';
import 'package:masajid/core/api/api_request.dart';
import 'package:masajid/features/azkar/model/azkar.dart';

class AzkarController extends GetxController{
  List<Azkar?>? azkar;
  bool isLoading=false;
  bool isClick=false;

  onChange(){
    isClick=!isClick;
    update();
  }

  Future<void> readAzkar()async{
    azkar=await ApiRequestController().getAzkar();
    isLoading=true;
  }

  @override
  void onInit() {
    super.onInit();
    readAzkar();
  }
}