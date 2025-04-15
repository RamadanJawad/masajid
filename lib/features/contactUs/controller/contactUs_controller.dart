import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:masajid/core/api/api_request.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/storage/shared_controller.dart';
import 'package:masajid/features/contactUs/model/reasons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsController extends GetxController {
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController reason;
  late TextEditingController name;
  String number = '';
  late TextEditingController message;
  var formKey = GlobalKey<FormState>();
  List<Reasons?>? reasons;
  bool isLoading = false;
  List<String> item = ["Loading..."];

  onChange(PhoneNumber phoneNumber) {
    number = "${phoneNumber.countryCode}${phoneNumber.number}";
    update();
  }

  List contactUs = [
    {"url": "www.burlingtonmasjid.com", "icon": ManagerAssets.link},
    {"url": "burlington.masjid@gmail.com", "icon": ManagerAssets.email},
    {"url": "+1-919-998-9078", "icon": ManagerAssets.phone}
  ];

  List socialMedia = [
    {"title":ManagerStrings.facebook,"url": "https://www.facebook.com/people/Burlington-Masjid/100064627872219/", "icon": ManagerAssets.facebook},
    {"title":ManagerStrings.instagram,"url": "https://www.instagram.com/burlingtonmasjidyouth/", "icon": ManagerAssets.instagram},
    {"title":ManagerStrings.whatsApp,"url": "https://chat.whatsapp.com/HuOY7bTMp5cABNNIk4PURC", "icon": ManagerAssets.whatsUp},
    {"title":ManagerStrings.youTube,"url": "https://www.youtube.com/channel/UCuC9cpLXR9VQiYJVpJg_RiA", "icon": ManagerAssets.youtube}
  ];
  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url.startsWith('http') ? url : 'https://$url');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> getReasons() async {
    try {
      reasons = await ApiRequestController().getReason();
      if (reasons != null && reasons!.isNotEmpty) {
        item = reasons!.map((e) => e!.text!.toString()).toList();
      } else {
        item = ["No Data Available"]; // Friendly message
      }
    } catch (e) {
      item = ["Failed to Load"]; // Handle API errors
    } finally {
      isLoading = false;
    }
    update();
  }

  Future<void> sendToContact() async {
    try {
      bool status = await ApiRequestController().sendToContact(
        deviceId: SharedPrefController().getDeviceId!,
          name: name.text,
          email: email.text,
          phone: number,
          reason: reason.text,
          message: message.text);
      if(status){
        Get.snackbar(
          "Success",
          "The message was sent successfully.",
          margin:const EdgeInsets.only(bottom: 5,left: 5,right: 5),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
          duration:const Duration(seconds: 4),
        );
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading = false;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    phone = TextEditingController();
    email = TextEditingController();
    reason = TextEditingController();
    name = TextEditingController();
    message = TextEditingController();
    getReasons();
  }

  @override
  void dispose() {
    super.dispose();
    phone.dispose();
    email.dispose();
    reason.dispose();
    name.dispose();
    message.dispose();
  }
}
