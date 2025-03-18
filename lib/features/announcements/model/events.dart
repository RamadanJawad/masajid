class Events {
  int? id;
  int? masjidId;
  String? title;
  String? details;
  String? place;
  String? start;
  String? end;
  String? link;
  String? createdAt;
  String? updatedAt;

  Events(
      {this.id,
        this.masjidId,
        this.title,
        this.details,
        this.place,
        this.start,
        this.end,
        this.link,
        this.createdAt,
        this.updatedAt});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    masjidId = json['masjid_id'];
    title = json['title'];
    details = json['details'];
    place = json['place'];
    start = json['start'];
    end = json['end'];
    link = json['link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['masjid_id'] = this.masjidId;
    data['title'] = this.title;
    data['details'] = this.details;
    data['place'] = this.place;
    data['start'] = this.start;
    data['end'] = this.end;
    data['link'] = this.link;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}