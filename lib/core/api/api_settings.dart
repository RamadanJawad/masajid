class ApiSetting {
  ApiSetting._();
  static const String baseUrl = 'https://masjid.hopetechapps.com/';
  static const String idMasjid = '1';
  static const String tasabih = '${baseUrl}api/mobile/tasabih';
  static const String features = '${baseUrl}api/mobile/masjids/$idMasjid/features';
  static const String hadith = '${baseUrl}api/mobile/hadiths/today';
  static const String iqamaSetting='${baseUrl}api/mobile/masjids/$idMasjid/prayers/settings';
  static const String azkar = '${baseUrl}api/mobile/azkar';
  static const String masjids = '${baseUrl}api/mobile/masjids';
  static const String reason =
      '${baseUrl}api/mobile/masjids/$idMasjid/contact-us/reasons';
  static const String contactUs = '${baseUrl}api/mobile/masjids/$idMasjid/contact-us';
  static const String announcements =
      '${baseUrl}api/mobile/masjids/1/announcements';
  static const String events = '${baseUrl}api/mobile/masjids/$idMasjid/events';
  static const String services = '${baseUrl}api/mobile/masjids/$idMasjid/services';
  static const String gallery = '${baseUrl}api/mobile/masjids/$idMasjid/gallery';
  static const String about = '${baseUrl}api/mobile/masjids/$idMasjid/about';
  static const String masjidDetails = '${baseUrl}api/mobile/masjids/$idMasjid';
  static const String deviceId = '${baseUrl}api/mobile/user';
  static const String donate = '${baseUrl}api/mobile/masjids/$idMasjid/donation-link';
}
