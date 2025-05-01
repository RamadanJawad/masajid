class IqamaSetting {
  Iqama? iqama;
  Jumaa? jumaa;

  IqamaSetting({this.iqama, this.jumaa});

  IqamaSetting.fromJson(Map<String, dynamic> json) {
    iqama = json['iqama'] != null ? new Iqama.fromJson(json['iqama']) : null;
    jumaa = json['jumaa'] != null ? new Jumaa.fromJson(json['jumaa']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iqama != null) {
      data['iqama'] = this.iqama!.toJson();
    }
    if (this.jumaa != null) {
      data['jumaa'] = this.jumaa!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['masjid_id'] = this.masjidId;
    data['fajr'] = this.fajr;
    data['dhuhr'] = this.dhuhr;
    data['asr'] = this.asr;
    data['maghrib'] = this.maghrib;
    data['isha'] = this.isha;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Jumaa {
  int? id;
  int? masjidId;
  String? begins;
  String? primaryAthan;
  String? iqama;
  String? createdAt;
  String? updatedAt;

  Jumaa(
      {this.id,
      this.masjidId,
      this.begins,
      this.primaryAthan,
      this.iqama,
      this.createdAt,
      this.updatedAt});

  Jumaa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    masjidId = json['masjid_id'];
    begins = json['begins'];
    primaryAthan = json['primary_athan'];
    iqama = json['iqama'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['masjid_id'] = this.masjidId;
    data['begins'] = this.begins;
    data['primary_athan'] = this.primaryAthan;
    data['iqama'] = this.iqama;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}