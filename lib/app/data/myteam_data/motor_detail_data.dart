class DataDetailMotor {
  DataDetailMotor({
    this.success,
    this.message,
    this.data,
  });
  late final bool? success;
  late final String? message;
  late final Data? data;

  DataDetailMotor.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    this.id,
    this.title,
    this.description,
    this.mediaUrl,
    this.thumbMediaUrl,
    this.createdAtFormatted,
    this.media,
  });
  late final int? id;
  late final String? title;
  late final String? description;
  late final String? mediaUrl;
  late final String? thumbMediaUrl;
  late final String? createdAtFormatted;
  late final List<Media>? media;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    mediaUrl = json['media_url'];
    thumbMediaUrl = json['thumb_media_url'];
    createdAtFormatted = json['created_at_formatted'];
    media = List.from(json['media']).map((e) => Media.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['media_url'] = mediaUrl;
    _data['thumb_media_url'] = thumbMediaUrl;
    _data['created_at_formatted'] = createdAtFormatted;
    _data['media'] = media!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Media {
  Media({
    this.id,
    this.motorId,
    this.description,
    this.mediaUrl,
    this.thumbMediaUrl,
    this.createdAtFormatted,
  });
  late final int? id;
  late final int? motorId;
  late final String? description;
  late final String? mediaUrl;
  late final String? thumbMediaUrl;
  late final String? createdAtFormatted;

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    motorId = json['motor_id'];
    description = json['description'];
    mediaUrl = json['media_url'];
    thumbMediaUrl = json['thumb_media_url'];
    createdAtFormatted = json['created_at_formatted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['motor_id'] = motorId;
    _data['description'] = description;
    _data['media_url'] = mediaUrl;
    _data['thumb_media_url'] = thumbMediaUrl;
    _data['created_at_formatted'] = createdAtFormatted;
    return _data;
  }
}
