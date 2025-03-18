import 'package:get/get.dart';
import 'package:flutter_quran/flutter_quran.dart';
class QuranController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    FlutterQuran().init();
  }
}