class Tasbih {
  int? id;
  TextLang? text;
  String? pronunciation;
  String? reference;
  String? createdAt;
  String? updatedAt;

  Tasbih(
      {this.id,
        this.text,
        this.pronunciation,
        this.reference,
        this.createdAt,
        this.updatedAt});

  Tasbih.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'] != null ? new TextLang.fromJson(json['text']) : null;
    pronunciation = json['pronunciation'];
    reference = json['reference'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class TextLang {
  String? en;
  String? ar;

  TextLang({this.en, this.ar});

  TextLang.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }
}