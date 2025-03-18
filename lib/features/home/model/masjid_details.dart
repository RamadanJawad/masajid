class MasjidDetails {
  int? id;
  int? userId;
  String? name;
  String? email;
  String? phone;
  String? country;
  String? city;
  String? address;
  String? latitude;
  String? longitude;
  String? createdAt;
  String? updatedAt;
  Logo? logo;

  MasjidDetails(
      {this.id,
        this.userId,
        this.name,
        this.email,
        this.phone,
        this.country,
        this.city,
        this.address,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt,
        this.logo,
       });

  MasjidDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];

    phone = json['phone'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    logo = json['logo'] != null ? new Logo.fromJson(json['logo']) : null;
  }
}

class Logo {
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

  Logo(
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

  Logo.fromJson(Map<String, dynamic> json) {
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
