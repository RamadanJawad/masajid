class Hadith {
  int? id;
  String? isnad;
  String? matn;
  Strength? strength;
  Strength? muhaddith;
  List<References>? references;
  String? description;
  String? showDate;
  String? createdAt;
  String? updatedAt;

  Hadith(
      {this.id,
        this.isnad,
        this.matn,
        this.strength,
        this.muhaddith,
        this.references,
        this.description,
        this.showDate,
        this.createdAt,
        this.updatedAt});

  Hadith.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isnad = json['isnad'];
    matn = json['matn'];
    strength = json['strength'] != null
        ? new Strength.fromJson(json['strength'])
        : null;
    muhaddith = json['muhaddith'] != null
        ? new Strength.fromJson(json['muhaddith'])
        : null;
    if (json['references'] != null) {
      references = <References>[];
      json['references'].forEach((v) {
        references!.add(new References.fromJson(v));
      });
    }
    description = json['description'];
    showDate = json['show_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Strength {
  String? en;
  String? ar;

  Strength({this.en, this.ar});

  Strength.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }
}

class References {
  String? title;
  String? reference;

  References({this.title, this.reference});

  References.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    reference = json['reference'];
  }
}