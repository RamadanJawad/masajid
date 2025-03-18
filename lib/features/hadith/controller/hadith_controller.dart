import 'package:get/get.dart';
import 'package:masajid/core/api/api_request.dart';
import 'package:masajid/features/hadith/model/hadith.dart';

class HadithController extends GetxController{
  bool isLoading = false;
  Hadith? hadith;

  readHadith() async {
    hadith = await ApiRequestController().getHadith();
    isLoading = true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    readHadith();
  }
}