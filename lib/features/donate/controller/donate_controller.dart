import 'package:get/get.dart';
import 'package:masajid/core/api/api_request.dart';
import 'package:masajid/features/donate/model/donate.dart';
import 'package:url_launcher/url_launcher.dart';

class DonateController extends GetxController{
  Donate? donate;
  bool isLoading=false;

  Future<void> donateData()async{
    try{
      donate=await ApiRequestController().donateNow();
      isLoading=true;
    }
    catch(e){
    print("Failed to Load");
    isLoading = false;// Handle API errors
    }
    update();
  }

  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url.startsWith('http') ? url : 'https://$url');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }



  @override
  void onInit() {
    super.onInit();
    donateData();
  }
}