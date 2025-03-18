class Announcements {
  int? id;
  int? masjidId;
  String? title;
  String? details;
  String? startDate;
  String? endDate;
  String? link;
  String? createdAt;
  String? updatedAt;
  Image? image;

  Announcements(
      {this.id,
        this.masjidId,
        this.title,
        this.details,
        this.startDate,
        this.endDate,
        this.link,
        this.createdAt,
        this.updatedAt,
        this.image});

  Announcements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    masjidId = json['masjid_id'];
    title = json['title'];
    details = json['details'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    link = json['link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }
}

class Image {
  int? id;
  String? modelType;
  int? modelId;
  String? uuid;
  String? collectionName;
  String? name;
  String? fileName;
  String? mimeType;
  String? disk;
  String? conversionsDisk;
  int? size;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? originalUrl;
  String? previewUrl;

  Image(
      {this.id,
        this.modelType,
        this.modelId,
        this.uuid,
        this.collectionName,
        this.name,
        this.fileName,
        this.mimeType,
        this.disk,
        this.conversionsDisk,
        this.size,
        this.orderColumn,
        this.createdAt,
        this.updatedAt,
        this.originalUrl,
        this.previewUrl});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    uuid = json['uuid'];
    collectionName = json['collection_name'];
    name = json['name'];
    fileName = json['file_name'];
    mimeType = json['mime_type'];
    disk = json['disk'];
    conversionsDisk = json['conversions_disk'];
    size = json['size'];
    orderColumn = json['order_column'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    originalUrl = json['original_url'];
    previewUrl = json['preview_url'];
  }
}