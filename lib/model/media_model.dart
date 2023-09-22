class MediaModel {
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
  List<String>? manipulations;
  List<String>? customProperties;
  List<String>? generatedConversions;
  List<String>? responsiveImages;
  int? orderColumn;
  String? createdAt;
  String? updatedAt;
  String? originalUrl;
  String? previewUrl;

  MediaModel({
    this.id,
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
    this.manipulations,
    this.customProperties,
    this.generatedConversions,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
    this.originalUrl,
    this.previewUrl,
  });

  MediaModel.fromJson(Map<String, dynamic> json) {
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
    if (json['manipulations'] != null) {
      manipulations = <String>[];
      json['manipulations'].forEach((v) {
        manipulations!.add(v);
      });
    }
    if (json['custom_properties'] != null) {
      customProperties = <String>[];
      json['custom_properties'].forEach((v) {
        customProperties!.add(v);
      });
    }
    if (json['generated_conversions'] != null) {
      generatedConversions = <String>[];
      json['generated_conversions'].forEach((v) {
        generatedConversions!.add(v);
      });
    }
    if (json['responsive_images'] != null) {
      responsiveImages = <String>[];
      json['responsive_images'].forEach((v) {
        responsiveImages!.add(v);
      });
    }
    orderColumn = json['order_column'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    originalUrl = json['original_url'];
    previewUrl = json['preview_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['model_type'] = modelType;
    data['model_id'] = modelId;
    data['uuid'] = uuid;
    data['collection_name'] = collectionName;
    data['name'] = name;
    data['file_name'] = fileName;
    data['mime_type'] = mimeType;
    data['disk'] = disk;
    data['conversions_disk'] = conversionsDisk;
    data['size'] = size;
    if (manipulations != null) {
      data['manipulations'] = manipulations!.map((v) => v).toList();
    }
    if (customProperties != null) {
      data['custom_properties'] = customProperties!.map((v) => v).toList();
    }
    if (generatedConversions != null) {
      data['generated_conversions'] =
          generatedConversions!.map((v) => v).toList();
    }
    if (responsiveImages != null) {
      data['responsive_images'] = responsiveImages!.map((v) => v).toList();
    }
    data['order_column'] = orderColumn;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['original_url'] = originalUrl;
    data['preview_url'] = previewUrl;
    return data;
  }
}
