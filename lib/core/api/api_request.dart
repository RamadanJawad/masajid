import 'dart:async';
import 'package:masajid/core/api/api_settings.dart';
import 'package:masajid/features/aboutUs/model/about.dart';
import 'package:masajid/features/announcements/model/events.dart';
import 'package:masajid/features/azkar/model/azkar.dart';
import 'package:masajid/features/contactUs/model/reasons.dart';
import 'package:masajid/features/donate/model/donate.dart';
import 'package:masajid/features/gallery/model/gallery.dart';
import 'package:masajid/features/hadith/model/hadith.dart';
import 'package:http/http.dart' as http;
import 'package:masajid/features/home/model/masjid_details.dart';
import 'package:masajid/features/home/model/prayerTime.dart';
import 'package:masajid/features/services/model/services.dart';
import 'package:masajid/features/splash/model/device.dart';
import 'package:masajid/features/tasbih/model/tasbih.dart';
import '../../features/announcements/model/announcements.dart';
import 'handle_api.dart';

class ApiRequestController {

  Future<Hadith?> getHadith() async {
    return handleRequest(() async {
      final url = Uri.parse(ApiSetting.hadith);
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      var jsonData = handleResponse(response)["data"];
      return Hadith.fromJson(jsonData);
    });
  }

  Future<About?> getAbout() async {
    return handleRequest(() async {
      final url = Uri.parse(ApiSetting.about);
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      var jsonData = handleResponse(response)["data"];
      return About.fromJson(jsonData);
    });
  }

  Future<Donate?> donateNow() async {
    return handleRequest(() async {
      final url = Uri.parse(ApiSetting.donate);
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      var jsonData = handleResponse(response)["data"];
      return Donate.fromJson(jsonData);
    });
  }

  Future<MasjidDetails?> masjidDetails() async {
    return handleRequest(() async {
      final url = Uri.parse(ApiSetting.masjidDetails);
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      var jsonData = handleResponse(response)["data"];
      return MasjidDetails.fromJson(jsonData);
    });
  }

  Future<Device?> sendDeviceId({required String deviceId}) async {
    return handleRequest(() async {
      final url = Uri.parse(ApiSetting.deviceId);
      final response = await http.post(url,body: {
        "device_id":deviceId,
        "masjid_id":"1"
      }).timeout(const Duration(seconds: 10));
      var jsonData = handleResponse(response)["data"];
      return Device.fromJson(jsonData);
    });
  }

  Future<List<Tasbih?>> getTasbih() async {
    return handleRequest(() async {
      final url = Uri.parse(ApiSetting.tasabih);
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      var jsonData = handleResponse(response)["data"] as List;
      return jsonData.map((e)=>Tasbih.fromJson(e)).toList();
    });
  }

  Future<List<Announcements?>> getAnnouncements() async {
    return handleRequest(() async {
      final url = Uri.parse(ApiSetting.announcements);
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      var jsonData = handleResponse(response)["data"] as List;
      return jsonData.map((e)=>Announcements.fromJson(e)).toList();
    });
  }

  Future<List<Events?>> getEvents() async {
    return handleRequest(() async {
      final url = Uri.parse(ApiSetting.events);
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      var jsonData = handleResponse(response)["data"] as List;
      return jsonData.map((e)=>Events.fromJson(e)).toList();
    });
  }

  Future<List<Azkar?>> getAzkar() async {
    return handleRequest(() async {
      final url = Uri.parse(ApiSetting.azkar);
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      var jsonData = handleResponse(response)["data"] as List;
      return jsonData.map((e)=>Azkar.fromJson(e)).toList();
    });
  }

  Future<List<Services?>> getServices() async {
    return handleRequest(() async {
      final url = Uri.parse(ApiSetting.services);
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      var jsonData = handleResponse(response)["data"] as List;
      return jsonData.map((e)=>Services.fromJson(e)).toList();
    });
  }

  Future<List<PrayerTime?>> getPrayTimes() async {
    return handleRequest(() async {
      final url = Uri.parse(ApiSetting.prayTimes);
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      var jsonData = handleResponse(response)["data"] as List;
      return jsonData.map((e)=>PrayerTime.fromJson(e)).toList();
    });
  }

  Future<List<Reasons?>> getReason() async {
    return handleRequest(() async {
      final url = Uri.parse(ApiSetting.reason);
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      var jsonData = handleResponse(response)["data"] as List;
      return jsonData.map((e)=>Reasons.fromJson(e)).toList();
    });
  }

  Future<List<Gallery?>> getGallery() async {
    return handleRequest(() async {
      final url = Uri.parse(ApiSetting.gallery);
      final response = await http.get(url).timeout(const Duration(seconds: 10));
      var jsonData = handleResponse(response)["data"] as List;
      return jsonData.map((e)=>Gallery.fromJson(e)).toList();
    });
  }

  Future<bool> sendToContact(
      {required String name,
      required String email,
      required String phone,
      required String reason,
      required String message,
        required String deviceId}) async {
    return handleRequest(() async {
      final url = Uri.parse(ApiSetting.contactUs);
      final response = await http.post(url,body: {
        "device_id":deviceId,
        "name": name,
        "email": email,
        "phone": phone,
        "reason_text": reason,
        "message": message,
      }).timeout(const Duration(seconds: 10));
      return true;
    });
  }
}
