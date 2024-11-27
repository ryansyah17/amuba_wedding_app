class DataProduk {
  DataProduk({
    this.success,
    this.message,
    this.data,
  });
  late final bool? success;
  late final String? message;
  late final List<Data>? data;

  DataProduk.fromJson(Map<String, dynamic> json) {
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
    this.namaProduk,
    this.deskripsi,
    this.color,
    this.slug,
    this.status,
    this.mediaUrl,
    this.thumbMediaUrl,
    this.createdAtFormatted,
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
    return _data;
  }
}
