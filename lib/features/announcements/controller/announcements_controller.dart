import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masajid/core/cache/cache.dart';
import 'package:masajid/features/announcements/model/events.dart';
import '../../../core/api/api_request.dart';
import '../model/announcements.dart';

class AnnouncementsController extends GetxController {
  List<Announcements?>? announcements;
  List<Events?>? events;
  bool isLoading = false;
  
  final CarouselController controller = CarouselController();
  int currentIndex = 0;

  Future<void> readAnnouncements() async {
    if (CacheData().getStatusAnnouncement() == false) {
      isLoading = false;
    }
    try {
      announcements = await ApiRequestController().getAnnouncements();
      events = await ApiRequestController().getEvents();
      isLoading = true;
    } catch (e) {
      print("Failed to Load");
      isLoading = false; // Handle API errors
    }
    update(); // Notify UI to update
  }

  onChange(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    readAnnouncements();
  }
}
