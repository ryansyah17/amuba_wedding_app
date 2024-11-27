class DataDetailRiders {
  DataDetailRiders({
    this.success,
    this.message,
    this.data,
  });
  late final bool? success;
  late final String? message;
  late final Data? data;

  DataDetailRiders.fromJson(Map<String, dynamic> json) {
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
    this.motor,
    this.statistik,
    this.history,
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
  late final List<Motor>? motor;
  late final Statistik? statistik;
  late final List<History>? history;

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
    motor = List.from(json['motor']).map((e) => Motor.fromJson(e)).toList();
    statistik = Statistik.fromJson(json['statistik']);
    history =
        List.from(json['history']).map((e) => History.fromJson(e)).toList();
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
    _data['motor'] = motor!.map((e) => e.toJson()).toList();
    _data['statistik'] = statistik!.toJson();
    _data['history'] = history!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Motor {
  Motor({
    this.id,
    this.pembalapId,
    this.status,
    this.mediaUrl,
    this.thumbMediaUrl,
    this.createdAtFormatted,
  });
  late final int? id;
  late final int? pembalapId;
  late final String? status;
  late final String? mediaUrl;
  late final String? thumbMediaUrl;
  late final String? createdAtFormatted;

  Motor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pembalapId = json['pembalap_id'];
    status = json['status'];
    mediaUrl = json['media_url'];
    thumbMediaUrl = json['thumb_media_url'];
    createdAtFormatted = json['created_at_formatted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pembalap_id'] = pembalapId;
    _data['status'] = status;
    _data['media_url'] = mediaUrl;
    _data['thumb_media_url'] = thumbMediaUrl;
    _data['created_at_formatted'] = createdAtFormatted;
    return _data;
  }
}

class Statistik {
  Statistik({
    this.id,
    this.pembalapId,
    this.victories,
    this.podium,
    this.poles,
    this.race,
  });
  late final int? id;
  late final int? pembalapId;
  late final String? victories;
  late final String? podium;
  late final String? poles;
  late final String? race;

  Statistik.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pembalapId = json['pembalap_id'];
    victories = json['victories'];
    podium = json['podium'];
    poles = json['poles'];
    race = json['race'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pembalap_id'] = pembalapId;
    _data['victories'] = victories;
    _data['podium'] = podium;
    _data['poles'] = poles;
    _data['race'] = race;
    return _data;
  }
}

class History {
  History({
    this.id,
    this.pembalapId,
    this.namaKejuaraan,
    this.kelas,
    this.tanggal,
    this.peringkat,
    this.status,
    this.mediaUrl,
    this.thumbMediaUrl,
    this.createdAtFormatted,
  });
  late final int? id;
  late final int? pembalapId;
  late final String? namaKejuaraan;
  late final String? kelas;
  late final String? tanggal;
  late final String? peringkat;
  late final String? status;
  late final String? mediaUrl;
  late final String? thumbMediaUrl;
  late final String? createdAtFormatted;

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pembalapId = json['pembalap_id'];
    namaKejuaraan = json['nama_kejuaraan'];
    kelas = json['kelas'];
    tanggal = json['tanggal'];
    peringkat = json['peringkat'];
    status = json['status'];
    mediaUrl = json['media_url'];
    thumbMediaUrl = json['thumb_media_url'];
    createdAtFormatted = json['created_at_formatted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pembalap_id'] = pembalapId;
    _data['nama_kejuaraan'] = namaKejuaraan;
    _data['kelas'] = kelas;
    _data['tanggal'] = tanggal;
    _data['peringkat'] = peringkat;
    _data['status'] = status;
    _data['media_url'] = mediaUrl;
    _data['thumb_media_url'] = thumbMediaUrl;
    _data['created_at_formatted'] = createdAtFormatted;
    return _data;
  }
}
