class Services {
  int? id;
  int? masjidId;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;
  ImageItem? image;
  ImageItem? icon;

  Services(
      {this.id,
        this.masjidId,
        this.title,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.icon});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    masjidId = json['masjid_id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null ? new ImageItem.fromJson(json['image']) : null;
    icon = json['icon'] != null ? new ImageItem.fromJson(json['icon']) : null;
  }
}

class ImageItem {
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

  ImageItem(
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

  ImageItem.fromJson(Map<String, dynamic> json) {
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