class FotoWeddingData {
  FotoWeddingData({
    this.success,
    this.message,
    this.wedding,
    this.media,
  });
  late final bool? success;
  late final String? message;
  late final Wedding? wedding;
  late final Media? media;

  FotoWeddingData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    wedding = Wedding.fromJson(json['wedding']);
    media = Media.fromJson(json['media']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['wedding'] = wedding!.toJson();
    _data['media'] = media!.toJson();
    return _data;
  }
}

class Wedding {
  Wedding({
    this.id,
    this.tanggal,
    this.weddingNama,
    this.lokasi,
    this.tanggalFormatted,
  });
  late final int? id;
  late final String? tanggal;
  late final String? weddingNama;
  late final String? lokasi;
  late final String? tanggalFormatted;

  Wedding.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tanggal = json['tanggal'];
    weddingNama = json['wedding_nama'];
    lokasi = json['lokasi'];
    tanggalFormatted = json['tanggal_formatted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['tanggal'] = tanggal;
    _data['wedding_nama'] = weddingNama;
    _data['lokasi'] = lokasi;
    _data['tanggal_formatted'] = tanggalFormatted;
    return _data;
  }
}

class Media {
  Media({
    this.count,
    this.currentPage,
    this.totalPage,
    this.results,
  });
  late final int? count;
  late final int? currentPage;
  late final int? totalPage;
  late final List<Results>? results;

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
    _data['results'] = results!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    this.id,
    this.weddingId,
    this.mediaUrl,
    this.thumbMediaUrl,
    this.createdAtFormatted,
  });
  late final int? id;
  late final int? weddingId;
  late final String? mediaUrl;
  late final String? thumbMediaUrl;
  late final String? createdAtFormatted;

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
