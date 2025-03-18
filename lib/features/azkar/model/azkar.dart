class Azkar {
  int? id;
  int? azkarCategoryId;
  Title? title;
  Title? text;
  Title? bless;
  String? pronunciation;
  int? frequency;
  String? reference;
  String? createdAt;
  String? updatedAt;
  AzkarCategory? azkarCategory;

  Azkar(
      {this.id,
        this.azkarCategoryId,
        this.title,
        this.text,
        this.bless,
        this.pronunciation,
        this.frequency,
        this.reference,
        this.createdAt,
        this.updatedAt,
        this.azkarCategory});

  Azkar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    azkarCategoryId = json['azkar_category_id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    text = json['text'] != null ? new Title.fromJson(json['text']) : null;
    bless = json['bless'] != null ? new Title.fromJson(json['bless']) : null;
    pronunciation = json['pronunciation'];
    frequency = json['frequency'];
    reference = json['reference'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    azkarCategory = json['azkar_category'] != null
        ? new AzkarCategory.fromJson(json['azkar_category'])
        : null;
  }
}

class Title {
  String? en;
  String? ar;

  Title({this.en, this.ar});

  Title.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }
}

class AzkarCategory {
  int? id;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;

  AzkarCategory(
      {this.id, this.title, this.description, this.createdAt, this.updatedAt});

  AzkarCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}