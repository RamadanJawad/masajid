class Reasons {
  int? id;
  String? text;
  int? showToUsers;
  String? createdAt;
  String? updatedAt;

  Reasons(
      {this.id, this.text, this.showToUsers, this.createdAt, this.updatedAt});

  Reasons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    showToUsers = json['show_to_users'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}