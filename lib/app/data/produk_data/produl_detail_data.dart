class DataDetailProduk {
  DataDetailProduk({
    this.success,
    this.message,
    this.data,
  });
  late final bool? success;
  late final String? message;
  late final Data? data;

  DataDetailProduk.fromJson(Map<String, dynamic> json) {
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
    this.namaProduk,
    this.deskripsi,
    this.color,
    this.slug,
    this.status,
    this.mediaUrl,
    this.thumbMediaUrl,
    this.createdAtFormatted,
    this.media,
  });
  late final int? id;
  late final String? namaProduk;
  late final String? deskripsi;
  late final String? color;
  late final String? slug;
  late final String? status;
  late final String? mediaUrl;
  late final String? thumbMediaUrl;
  late final String? createdAtFormatted;
  late final List<Media>? media;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaProduk = json['nama_produk'];
    deskripsi = json['deskripsi'];
    color = json['color'];
    slug = json['slug'];
    status = json['status'];
    mediaUrl = json['media_url'];
    thumbMediaUrl = json['thumb_media_url'];
    createdAtFormatted = json['created_at_formatted'];
    media = List.from(json['media']).map((e) => Media.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nama_produk'] = namaProduk;
    _data['deskripsi'] = deskripsi;
    _data['color'] = color;
    _data['slug'] = slug;
    _data['status'] = status;
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
    this.productId,
    this.description,
    this.mediaUrl,
    this.thumbMediaUrl,
    this.createdAtFormatted,
  });
  late final int? id;
  late final int? productId;
  late final String? description;
  late final String? mediaUrl;
  late final String? thumbMediaUrl;
  late final String? createdAtFormatted;

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    description = json['description'];
    mediaUrl = json['media_url'];
    thumbMediaUrl = json['thumb_media_url'];
    createdAtFormatted = json['created_at_formatted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_id'] = productId;
    _data['description'] = description;
    _data['media_url'] = mediaUrl;
    _data['thumb_media_url'] = thumbMediaUrl;
    _data['created_at_formatted'] = createdAtFormatted;
    return _data;
  }
}
