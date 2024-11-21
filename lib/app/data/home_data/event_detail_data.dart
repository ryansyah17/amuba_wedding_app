class DataDetailEvent {
  DataDetailEvent({
    this.success,
    this.message,
    this.event,
    this.media,
  });
  late final bool? success;
  late final String? message;
  late final Event? event;
  late final Media? media;

  DataDetailEvent.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    event = Event.fromJson(json['event']);
    media = Media.fromJson(json['media']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['event'] = event!.toJson();
    _data['media'] = media!.toJson();
    return _data;
  }
}

class Event {
  Event({
    this.id,
    this.tanggal,
    this.weddingNama,
    this.lokasi,
    this.categoryId,
    this.status,
    this.tanggalFormatted,
    this.mediaUrl,
    this.thumbMediaUrl,
    this.category,
  });
  late final int? id;
  late final String? tanggal;
  late final String? weddingNama;
  late final String? lokasi;
  late final int? categoryId;
  late final String? status;
  late final String? tanggalFormatted;
  late final String? mediaUrl;
  late final String? thumbMediaUrl;
  late final Category? category;

  Event.fromJson(Map<String, dynamic> json) {
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
    _data['category'] = category!.toJson();
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

class Media {
  Media({
    required this.count,
    required this.currentPage,
    required this.totalPage,
    required this.results,
  });
  late final int count;
  late final int currentPage;
  late final int totalPage;
  late final List<Results> results;

  Media.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    currentPage = json['current_page'];
    totalPage = json['total_page'];
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['current_page'] = currentPage;
    _data['total_page'] = totalPage;
    _data['results'] = results.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    required this.id,
    required this.weddingId,
    required this.mediaUrl,
    required this.thumbMediaUrl,
    required this.createdAtFormatted,
  });
  late final int id;
  late final int weddingId;
  late final String mediaUrl;
  late final String thumbMediaUrl;
  late final String createdAtFormatted;

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    weddingId = json['wedding_id'];
    mediaUrl = json['media_url'];
    thumbMediaUrl = json['thumb_media_url'];
    createdAtFormatted = json['created_at_formatted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['wedding_id'] = weddingId;
    _data['media_url'] = mediaUrl;
    _data['thumb_media_url'] = thumbMediaUrl;
    _data['created_at_formatted'] = createdAtFormatted;
    return _data;
  }
}
