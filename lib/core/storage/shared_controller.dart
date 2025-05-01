import 'dart:async';
import 'dart:convert';
import 'package:masajid/features/home/model/prayerTime.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  SharedPrefController._();

  static SharedPrefController? _instance;
  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future saveDeviceId({required String deviceId}) async {
    await _sharedPreferences.setString("device_id", deviceId);
  }

  Future saveJoma({required String timeJoma}) async {
    await _sharedPreferences.setString("time_joma", timeJoma);
  }

  Future saveIqama({required IqamaSetting iqamaSetting}) async {
    await _sharedPreferences.setInt("time_fajr", iqamaSetting.iqama!.fajr!);
    await _sharedPreferences.setInt("time_dhuhr", iqamaSetting.iqama!.dhuhr!);
    await _sharedPreferences.setInt("time_asr", iqamaSetting.iqama!.asr!);
    await _sharedPreferences.setInt(
        "time_maghrib", iqamaSetting.iqama!.maghrib!);
    await _sharedPreferences.setInt("time_isha", iqamaSetting.iqama!.isha!);
  }

  Future saveLatLong({required String lat, required String long}) async {
    await _sharedPreferences.setString("lat", lat);
    await _sharedPreferences.setString("long", long);
  }

  int? get getTimeFajr {
    return _sharedPreferences.getInt("time_fajr");
  }
  int? get getTimeDhuhr {
    return _sharedPreferences.getInt("time_dhuhr");
  }
  int? get getTimeAsr {
    return _sharedPreferences.getInt("time_asr");
  }
  int? get getTimeMagrib {
    return _sharedPreferences.getInt("time_maghrib");
  }
  int? get getTimeIsha {
    return _sharedPreferences.getInt("time_isha");
  }

  String? get getDeviceId {
    return _sharedPreferences.getString("device_id");
  }

  String? get getJomaTime {
    return _sharedPreferences.getString("time_joma");
  }

  String? get getLat {
    return _sharedPreferences.getString("lat");
  }

  String? get getLong {
    return _sharedPreferences.getString("long");
  }

  Future initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
