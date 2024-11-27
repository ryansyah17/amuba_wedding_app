class DataWhatsApp {
  DataWhatsApp({
    this.success,
    this.message,
    this.data,
  });
  late final bool? success;
  late final String? message;
  late final Data? data;

  DataWhatsApp.fromJson(Map<String, dynamic> json) {
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
    required this.whatsappNumber,
  });
  late final String whatsappNumber;

  Data.fromJson(Map<String, dynamic> json) {
    whatsappNumber = json['whatsapp_number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['whatsapp_number'] = whatsappNumber;
    return _data;
  }
}
