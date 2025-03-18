class About {
  int? id;
  int? masjidId;
  String? about;
  String? mission;
  String? vision;
  String? createdAt;
  String? updatedAt;
  AboutImage? aboutImage;
  AboutImage? missionIcon;
  AboutImage? visionIcon;

  About(
      {this.id,
        this.masjidId,
        this.about,
        this.mission,
        this.vision,
        this.createdAt,
        this.updatedAt,
        this.aboutImage,
        this.missionIcon,
        this.visionIcon});

  About.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    masjidId = json['masjid_id'];
    about = json['about'];
    mission = json['mission'];
    vision = json['vision'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    aboutImage = json['about_image'] != null
        ? new AboutImage.fromJson(json['about_image'])
        : null;
    missionIcon = json['mission_icon'] != null
        ? new AboutImage.fromJson(json['mission_icon'])
        : null;
    visionIcon = json['vision_icon'] != null
        ? new AboutImage.fromJson(json['vision_icon'])
        : null;
  }
}

class AboutImage {
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

  AboutImage(
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

  AboutImage.fromJson(Map<String, dynamic> json) {
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