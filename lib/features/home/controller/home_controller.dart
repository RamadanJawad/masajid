import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:masajid/core/api/api_request.dart';
import 'package:masajid/core/cache/cache.dart';
import 'package:masajid/core/storage/shared_controller.dart';
import 'package:masajid/features/home/model/features.dart';
import 'package:masajid/features/home/model/masjid_details.dart';
import 'package:masajid/features/home/model/prayerTime.dart';

class HomeController extends GetxController {
  String? currentPrayName;
  String? prayTime;
  PrayerTimes? prayerTimes;
  Coordinates? coordinates;
  CalculationParameters? parameter;
  List prayTimeData = [];
  bool isLoading = true;
  String? jomaTime;
  String? currentPrayTime;
  bool isLoadingMenu = false;
  List<Features?>? features;
  IqamaSetting? iqamaSetting;
  DateTime dateTime = DateTime.now();
  MasjidDetails? masjidDetails;
  String? selectedNotificationPrayer;

  Future<void> readFeatures() async {
    features = await ApiRequestController().getFeatures();
    isLoadingMenu = true;
    for (var i = 0; i < features!.length; i++) {
      if (features![i]!.name == "Announcements") {
        CacheData().setStatusAnnouncement(true);
      } else {
        CacheData().setStatusAnnouncement(false);
      }
    }
    update();
  }

  Future<void> readIqamaAndJoma() async {
    isLoading = true;
    update();
    List<String>? localJomaTimes = SharedPrefController().getJomaTimes;
    if (localJomaTimes != null && localJomaTimes.isNotEmpty) {
      jomaTime = localJomaTimes.first;
    }
    try {
      iqamaSetting = await ApiRequestController().getIqamaSetting();
      if (iqamaSetting?.jumaa?.iqama != null &&
          iqamaSetting!.jumaa!.athans!.isNotEmpty) {
        // نحفظ أول وقت كافتراضي (اختياري)
        jomaTime = iqamaSetting!.jumaa!.athans!.first;
        await SharedPrefController()
            .saveJomaTimes(times: iqamaSetting!.jumaa!.athans!);
      }
      SharedPrefController().saveIqama(iqamaSetting: iqamaSetting!);
    } catch (e) {
      if (localJomaTimes == null || localJomaTimes.isEmpty) {
        jomaTime = null;
      } else {
        jomaTime = localJomaTimes.first;
      }
    }
    isLoading = false;
    update();
  }

  Future<void> initPryTime() async {
    if (SharedPrefController().getLat != null &&
        SharedPrefController().getLong != null) {
      coordinates = Coordinates(double.parse(SharedPrefController().getLat!),
          double.parse(SharedPrefController().getLong!));
    } else {
      masjidDetails = await ApiRequestController().masjidDetails();
      if (masjidDetails != null &&
          masjidDetails!.latitude != null &&
          masjidDetails!.longitude != null) {
        String lat = masjidDetails!.latitude!;
        String lon = masjidDetails!.longitude!;
        coordinates = Coordinates(double.parse(lat), double.parse(lon));
        SharedPrefController().saveLatLong(lat: lat, long: lon);
      } else {
        isLoading = false;
        update();
        return;
      }
    }
    parameter = CalculationMethod.moon_sighting_committee.getParameters();
    parameter!.madhab = Madhab.shafi;
    prayerTimes = PrayerTimes.today(coordinates!, parameter!);
    prayTimeData = [
      {
        "name": "Fajr         ",
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
        "name": "Asr           ",
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
        "name": "Isha          ",
        "time": prayerTimes!.isha,
        "salahBegin": DateFormat.jm().format(prayerTimes!.isha),
        "salahIqaamah": DateFormat.jm()
            .format(prayerTimes!.isha.add(const Duration(minutes: 15)))
      },
    ];
    determineCurrentPrayer();
    isLoading = false;
    update();
  }

  String formatJomaTime(String time24) {
    try {
      final inputFormat = DateFormat("HH:mm:ss");
      final dateTime = inputFormat.parse(time24);
      final outputFormat = DateFormat("h:mm a"); // 12-hour format with AM/PM
      return outputFormat.format(dateTime);
    } catch (e) {
      return time24; // fallback if parsing fails
    }
  }

  void determineCurrentPrayer() {
    DateTime now = DateTime.now();
    DateTime? lastPrayerTime;
    String? lastPrayerName;
    String? lastPrayerBegin;

    for (var prayer in prayTimeData) {
      DateTime prayerTime = prayer["time"];
      if (now.isAfter(prayerTime)) {
        lastPrayerTime = prayerTime;
        lastPrayerName = prayer["name"];
        lastPrayerBegin = prayer["salahBegin"];
      }
    }

    if (lastPrayerTime != null) {
      currentPrayName = lastPrayerName;
      currentPrayTime = lastPrayerBegin;
      dateTime = lastPrayerTime;
    } else {
      // إذا لم يبدأ أي وقت صلاة بعد (مثلاً قبل الفجر)
      currentPrayName = prayTimeData.first["name"];
      currentPrayTime = prayTimeData.first["salahBegin"];
      dateTime = prayTimeData.first["time"];
    }

    update();
  }

  void toggleNotification(String prayerName) {
    selectedNotificationPrayer =
        (selectedNotificationPrayer == prayerName) ? null : prayerName;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    readFeatures();
    initPryTime();
    readIqamaAndJoma();
    Timer.periodic(const Duration(minutes: 1), (timer) {
      determineCurrentPrayer();
    });
  }
}
