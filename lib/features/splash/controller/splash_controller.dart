import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:masajid/core/api/api_request.dart';
import 'package:masajid/core/storage/shared_controller.dart';
import 'package:masajid/routes/routes.dart';
import '../model/device.dart';
import 'dart:io' show Platform;


class SplashController extends GetxController {
  Device? device;

  Future<void> sendDeviceIdAndStore()async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      device=await ApiRequestController().sendDeviceId(deviceId:androidInfo.id.toString());
      if(device != null) {
        SharedPrefController().saveDeviceId(deviceId: device!.deviceId.toString());
      }
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      device=await ApiRequestController().sendDeviceId(deviceId:iosInfo.identifierForVendor.toString());
      if(device != null) {
        SharedPrefController().saveDeviceId(deviceId: iosInfo.identifierForVendor.toString());
      }
    }
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
