import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:masajid/core/api/api_request.dart';
import 'package:masajid/core/storage/shared_controller.dart';
import 'package:masajid/features/home/model/features.dart';
import 'package:masajid/features/home/model/masjid_details.dart';

class HomeController extends GetxController {
  String? currentPray;
  String? prayTime;
  PrayerTimes? prayerTimes;
  Coordinates? coordinates;
  CalculationParameters? parameter;
  List prayTimeData = [];
  List<Features?>? features;
  late DateTime dateTime = DateTime.now();
  MasjidDetails? masjidDetails;
  String? selectedNotificationPrayer;
  Future<void> readFeatures() async {
    features = await ApiRequestController().getFeatures();
    update();
  }

  Future<void> getMasjidDetails() async {
    if (SharedPrefController().getLat == null) {
      masjidDetails = await ApiRequestController().masjidDetails();
      await SharedPrefController().saveLatLong(
          lat: masjidDetails!.latitude!, long: masjidDetails!.longitude!);
      initPryTime();
      Timer.periodic(const Duration(minutes: 1), (timer) {
        determineCurrentPrayer();
      });
      update();
    } else {
      initPryTime();
      Timer.periodic(const Duration(minutes: 1), (timer) {
        determineCurrentPrayer();
      });
      update();
    }
  }

  initPryTime() {
    coordinates = Coordinates(
        35.78056000,
        78.63890000);
    parameter = CalculationMethod.moon_sighting_committee.getParameters();
    parameter!.madhab = Madhab.shafi;
    prayerTimes = PrayerTimes.today(coordinates!, parameter!);
    prayTimeData = [
      {
        "name": "Fajr        ",
        "time": prayerTimes!.fajr,
        "salahBegin": DateFormat.jm().format(prayerTimes!.fajr),
        "salahIqaamah": DateFormat.jm()
            .format(prayerTimes!.fajr.add(const Duration(minutes: 20)))
      },
      {
        "name": "Dhuhr    ",
        "time": prayerTimes!.dhuhr,
        "salahBegin": DateFormat.jm().format(prayerTimes!.dhuhr),
        "salahIqaamah": DateFormat.jm()
            .format(prayerTimes!.dhuhr.add(const Duration(minutes: 10)))
      },
      {
        "name": "Asr         ",
        "time": prayerTimes!.asr,
        "salahBegin": DateFormat.jm().format(prayerTimes!.asr),
        "salahIqaamah": DateFormat.jm()
            .format(prayerTimes!.asr.add(const Duration(minutes: 10)))
      },
      {
        "name": "Maghrib",
        "time": prayerTimes!.maghrib,
        "salahBegin": DateFormat.jm().format(prayerTimes!.maghrib),
        "salahIqaamah": DateFormat.jm()
            .format(prayerTimes!.maghrib.add(const Duration(minutes: 10)))
      },
      {
        "name": "Isha       ",
        "time": prayerTimes!.isha,
        "salahBegin": DateFormat.jm().format(prayerTimes!.isha),
        "salahIqaamah": DateFormat.jm()
            .format(prayerTimes!.isha.add(const Duration(minutes: 10)))
      },
    ];

    determineCurrentPrayer();
    update();
  }

  //To know the current prayer time
  void determineCurrentPrayer() {
    DateTime now = DateTime.now();
    for (int i = 0; i < prayTimeData.length; i++) {
      DateTime prayerTime = prayTimeData[i]["time"];
      if (now.isAfter(prayerTime)) {
        currentPray = prayTimeData[i]["name"];
      }
    }
    update();
  }

  // Toggle notification for a specific prayer
  void toggleNotification(String prayerName) {
    if (selectedNotificationPrayer == prayerName) {
      selectedNotificationPrayer =
          null; // Turn off notifications if already enabled
    } else {
      selectedNotificationPrayer = prayerName; // Set the selected prayer
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getMasjidDetails();
    readFeatures();
  }
}
