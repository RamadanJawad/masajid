class Features {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;
  Icon? icon;

  Features(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.pivot,
      this.icon});

  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    icon = json['icon'] != null ? new Icon.fromJson(json['icon']) : null;
  }
}

class Pivot {
  int? masjidId;
  int? featureId;
  int? isAvailable;

  Pivot({this.masjidId, this.featureId, this.isAvailable});

  Pivot.fromJson(Map<String, dynamic> json) {
    masjidId = json['masjid_id'];
    featureId = json['feature_id'];
    isAvailable = json['is_available'];
  }
}

class Icon {
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

  Icon(
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

  Icon.fromJson(Map<String, dynamic> json) {
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