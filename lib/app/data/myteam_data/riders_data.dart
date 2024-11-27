class DataRiders {
  DataRiders({
    this.success,
    this.message,
    this.data,
  });
  late final bool? success;
  late final String? message;
  late final List<Data>? data;

  DataRiders.fromJson(Map<String, dynamic> json) {
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
    this.namaLengkap,
    this.namaJulukan,
    this.tanggalLahir,
    this.kebangsaan,
    this.kotaAsal,
    this.deskripsi,
    this.status,
    this.mediaUrl,
    this.thumbMediaUrl,
    this.usiaPembalapFormatted,
    this.tinggiBadanFormatted,
    this.beratBadanFormatted,
  });
  late final int? id;
  late final String? namaLengkap;
  late final String? namaJulukan;
  late final String? tanggalLahir;
  late final String? kebangsaan;
  late final String? kotaAsal;
  late final String? deskripsi;
  late final String? status;
  late final String? mediaUrl;
  late final String? thumbMediaUrl;
  late final String? usiaPembalapFormatted;
  late final String? tinggiBadanFormatted;
  late final String? beratBadanFormatted;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaLengkap = json['nama_lengkap'];
    namaJulukan = json['nama_julukan'];
    tanggalLahir = json['tanggal_lahir'];
    kebangsaan = json['kebangsaan'];
    kotaAsal = json['kota_asal'];
    deskripsi = json['deskripsi'];
    status = json['status'];
    mediaUrl = json['media_url'];
    thumbMediaUrl = json['thumb_media_url'];
    usiaPembalapFormatted = json['usia_pembalap_formatted'];
    tinggiBadanFormatted = json['tinggi_badan_formatted'];
    beratBadanFormatted = json['berat_badan_formatted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nama_lengkap'] = namaLengkap;
    _data['nama_julukan'] = namaJulukan;
    _data['tanggal_lahir'] = tanggalLahir;
    _data['kebangsaan'] = kebangsaan;
    _data['kota_asal'] = kotaAsal;
    _data['deskripsi'] = deskripsi;
    _data['status'] = status;
    _data['media_url'] = mediaUrl;
    _data['thumb_media_url'] = thumbMediaUrl;
    _data['usia_pembalap_formatted'] = usiaPembalapFormatted;
    _data['tinggi_badan_formatted'] = tinggiBadanFormatted;
    _data['berat_badan_formatted'] = beratBadanFormatted;
    return _data;
  }
}
