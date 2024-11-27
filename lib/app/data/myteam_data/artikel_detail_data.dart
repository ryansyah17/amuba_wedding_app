class DataDetailArtikel {
  DataDetailArtikel({
    this.success,
    this.message,
    this.data,
  });
  late final bool? success;
  late final String? message;
  late final Data? data;

  DataDetailArtikel.fromJson(Map<String, dynamic> json) {
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
    required this.id,
    required this.blogCategoryId,
    required this.title,
    required this.slug,
    required this.description,
    required this.status,
    required this.mediaUrl,
    required this.thumbMediaUrl,
    required this.createdAtFormatted,
  });
  late final int id;
  late final int blogCategoryId;
  late final String title;
  late final String slug;
  late final String description;
  late final String status;
  late final String mediaUrl;
  late final String thumbMediaUrl;
  late final String createdAtFormatted;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    blogCategoryId = json['blog_category_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];

    status = json['status'];
    mediaUrl = json['media_url'];
    thumbMediaUrl = json['thumb_media_url'];
    createdAtFormatted = json['created_at_formatted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['blog_category_id'] = blogCategoryId;
    _data['title'] = title;
    _data['slug'] = slug;
    _data['description'] = description;
    _data['status'] = status;
    _data['media_url'] = mediaUrl;
    _data['thumb_media_url'] = thumbMediaUrl;
    _data['created_at_formatted'] = createdAtFormatted;
    return _data;
  }
}
