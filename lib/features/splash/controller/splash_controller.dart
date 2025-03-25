import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:masajid/core/api/api_request.dart';
import 'package:masajid/core/storage/shared_controller.dart';
import 'package:masajid/routes/routes.dart';
import '../model/device.dart';

class SplashController extends GetxController {
  Device? device;

  Future<void> sendDeviceIdAndStore()async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    SharedPrefController().saveDeviceId(deviceId: androidInfo.id.toString());
    device=await ApiRequestController().sendDeviceId(deviceId:androidInfo.id.toString());
    
  }
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      if(SharedPrefController().getDeviceId ==null){
        sendDeviceIdAndStore();
      }
      Get.offNamed(Routes.main);
    });
  }
}
