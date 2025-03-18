import 'dart:async';
import 'dart:convert';
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

  Future saveLatLong({required String lat, required String long}) async {
    await _sharedPreferences.setString("lat", lat);
    await _sharedPreferences.setString("long", long);
  }

  String? get getDeviceId {
    return _sharedPreferences.getString("device_id") ?? "";
  }

  String? get getLat{
    return _sharedPreferences.getString("lat")??"35.78056000";
  }
  String? get getLong{
    return _sharedPreferences.getString("long")??"-78.63890000";
  }

  Future initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
