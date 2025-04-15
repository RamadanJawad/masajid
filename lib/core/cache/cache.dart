class CacheItem {
  String? imagePath;
  String? iconPath;
  String? details;
  String? title;
  String? dateTime;

  CacheItem.announcements(
      {required this.imagePath,
      required this.details,
      required this.title,
      required this.dateTime});

  CacheItem.services(
      {required this.imagePath,
      required this.details,
      required this.title,
      required this.iconPath});
}

class CacheData {
  bool? isAnnouncement;

  void setStatusAnnouncement(bool isAnnouncement) {
    isAnnouncement = isAnnouncement;
  }

  bool? getStatusAnnouncement() {
    return isAnnouncement;
  }
}
