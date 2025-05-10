class IqamaSetting {
  Iqama? iqama;
  Jumaa? jumaa;

  IqamaSetting({this.iqama, this.jumaa});

  IqamaSetting.fromJson(Map<String, dynamic> json) {
    iqama = json['iqama'] != null ? new Iqama.fromJson(json['iqama']) : null;
    jumaa = json['jumaa'] != null ? new Jumaa.fromJson(json['jumaa']) : null;
  }
}

class Iqama {
  int? id;
  int? masjidId;
  int? fajr;
  int? dhuhr;
  int? asr;
  int? maghrib;
  int? isha;
  String? createdAt;
  String? updatedAt;

  Iqama(
      {this.id,
      this.masjidId,
      this.fajr,
      this.dhuhr,
      this.asr,
      this.maghrib,
      this.isha,
      this.createdAt,
      this.updatedAt});

  Iqama.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    masjidId = json['masjid_id'];
    fajr = json['fajr'];
    dhuhr = json['dhuhr'];
    asr = json['asr'];
    maghrib = json['maghrib'];
    isha = json['isha'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Jumaa {
  int? id;
  int? masjidId;
  List<String>? athans;
  String? iqama;
  String? createdAt;
  String? updatedAt;

  Jumaa(
      {this.id,
      this.masjidId,
      this.athans,
      this.iqama,
      this.createdAt,
      this.updatedAt});

  Jumaa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    masjidId = json['masjid_id'];
    athans = json['athans'].cast<String>();
    iqama = json['iqama'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}