class DataEvent {
  DataEvent({
    this.success,
    this.message,
    this.data,
  });
  late final bool? success;
  late final String? message;
  late final List<Data>? data;

  DataEvent.fromJson(Map<String, dynamic> json) {
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
    required this.id,
    required this.tanggal,
    required this.weddingNama,
    required this.lokasi,
    required this.categoryId,
    required this.status,
    required this.tanggalFormatted,
    required this.mediaUrl,
    required this.thumbMediaUrl,
    required this.category,
  });
  late final int id;
  late final String tanggal;
  late final String weddingNama;
  late final String lokasi;
  late final int categoryId;
  late final String status;
  late final String tanggalFormatted;
  late final String mediaUrl;
  late final String thumbMediaUrl;
  late final Category category;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tanggal = json['tanggal'];
    weddingNama = json['wedding_nama'];
    lokasi = json['lokasi'];
    categoryId = json['category_id'];
    status = json['status'];
    tanggalFormatted = json['tanggal_formatted'];
    mediaUrl = json['media_url'];
    thumbMediaUrl = json['thumb_media_url'];
    category = Category.fromJson(json['category']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['tanggal'] = tanggal;
    _data['wedding_nama'] = weddingNama;
    _data['lokasi'] = lokasi;
    _data['category_id'] = categoryId;
    _data['status'] = status;
    _data['tanggal_formatted'] = tanggalFormatted;
    _data['media_url'] = mediaUrl;
    _data['thumb_media_url'] = thumbMediaUrl;
    _data['category'] = category.toJson();
    return _data;
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.slug,
    required this.status,
  });
  late final int id;
  late final String name;
  late final String description;
  late final String slug;
  late final String status;

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    slug = json['slug'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['slug'] = slug;
    _data['status'] = status;
    return _data;
  }
}
