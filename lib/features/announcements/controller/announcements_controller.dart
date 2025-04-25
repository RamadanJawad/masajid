import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masajid/core/cache/cache.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/features/announcements/model/events.dart';
import '../../../core/api/api_request.dart';
import '../model/announcements.dart';

class AnnouncementsController extends GetxController {
  List<Announcements?>? announcements;
  List<Events?>? events;
  final ScrollController scrollController = ScrollController();
  int currentPage = 0;
  bool isLoading = false;
  int activeIndex = 0;

  onChange(index) {
    currentPage = index;
    update();
  }

  void onScroll() {
    double offset = scrollController.offset;
    double itemWidth =
        ManagerWidth.w280 + ManagerWidth.w16; // item width + margin
    int currentIndex = (offset / itemWidth).round();

    if (activeIndex != currentIndex) {
      activeIndex = currentIndex;
      update();
    }
  }

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

  @override
  void onInit() {
    super.onInit();
    readAnnouncements();
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    scrollController.removeListener(onScroll);
    scrollController.dispose();
    super.dispose();
  }
}
