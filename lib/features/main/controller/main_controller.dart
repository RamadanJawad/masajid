import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/features/announcements/view/screen/announcements_screen.dart';
import 'package:masajid/features/contactUs/view/screen/contactUs_screen.dart';
import 'package:masajid/features/donate/view/screen/donate_screen.dart';
import 'package:masajid/features/home/view/screen/home_screen.dart';

class MainController extends GetxController {
  var currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    update();
  }

  List<String> listOfIcons = [
    ManagerAssets.home,
    ManagerAssets.services,
    ManagerAssets.call,
    ManagerAssets.donate,
  ];
  List<Widget> screen = [
    const HomeScreen(),
    const AnnouncementsScreen(),
    const ContactUsScreen(
      status: false,
    ),
    const DonateScreen(
      status: false,
    ),
  ];
}
