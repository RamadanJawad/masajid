class Device {
  int? masjidId;
  String? deviceId;
  String? userAgent;
  String? updatedAt;
  String? createdAt;
  int? id;

  Device(
      {this.masjidId,
        this.deviceId,
        this.userAgent,
        this.updatedAt,
        this.createdAt,
        this.id});

  Device.fromJson(Map<String, dynamic> json) {
    masjidId = json['masjid_id'];
    deviceId = json['device_id'];
    userAgent = json['user_agent'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}