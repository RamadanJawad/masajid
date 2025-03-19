class ApiSetting {
  ApiSetting._();
  static const String baseUrl = 'http://147.182.210.42/';
  static const String tasabih = '${baseUrl}api/mobile/tasabih';
  static const String features = '${baseUrl}api/mobile/masjids/1/features';
  static const String hadith = '${baseUrl}api/mobile/hadiths/today';
  static const String azkar = '${baseUrl}api/mobile/azkar?category_id=1';
  static const String masjids = '${baseUrl}api/mobile/masjids';
  static const String reason =
      '${baseUrl}api/mobile/masjids/1/contact-us/reasons';
  static const String contactUs = '${baseUrl}api/mobile/masjids/1/contact-us';
  static const String announcements =
      '${baseUrl}api/mobile/masjids/1/announcements';
  static const String events = '${baseUrl}api/mobile/masjids/1/events';
  static const String services = '${baseUrl}api/mobile/masjids/1/services';
  static const String gallery = '${baseUrl}api/mobile/masjids/1/gallery';
  static const String about = '${baseUrl}api/mobile/masjids/1/about';
  static const String masjidDetails = '${baseUrl}api/mobile/masjids/1';
  static const String deviceId = '${baseUrl}api/mobile/user';
  static const String donate = '${baseUrl}api/mobile/masjids/1/donation-link';
  static const String prayTimes = '${baseUrl}api/mobile/masjids/1/prayers';
}
