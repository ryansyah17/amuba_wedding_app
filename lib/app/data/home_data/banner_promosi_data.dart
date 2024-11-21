class DataBannerPromosi {
  DataBannerPromosi({
    this.success,
    this.message,
    this.data,
  });
  late final bool? success;
  late final String? message;
  late final List<Data>? data;

  DataBannerPromosi.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    this.id,
    this.kategori,
    this.title,
    this.description,
    this.link,
    this.status,
    this.mediaUrl,
    this.thumbMediaUrl,
  });
  late final int? id;
  late final String? kategori;
  late final String? title;
  late final String? description;
  late final String? link;
  late final String? status;
  late final String? mediaUrl;
  late final String? thumbMediaUrl;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kategori = json['kategori'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    status = json['status'];
    mediaUrl = json['media_url'];
    thumbMediaUrl = json['thumb_media_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['kategori'] = kategori;
    _data['title'] = title;
    _data['description'] = description;
    _data['link'] = link;
    _data['status'] = status;
    _data['media_url'] = mediaUrl;
    _data['thumb_media_url'] = thumbMediaUrl;
    return _data;
  }
}
