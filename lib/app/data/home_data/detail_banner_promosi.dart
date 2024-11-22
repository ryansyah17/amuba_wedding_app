class DataDetailBannerPromosi {
  DataDetailBannerPromosi({
    this.success,
    this.message,
    this.slider,
    this.sliderMedia,
  });
  late final bool? success;
  late final String? message;
  late final Slider? slider;
  late final List<SliderMedia>? sliderMedia;

  DataDetailBannerPromosi.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    slider = Slider.fromJson(json['slider']);
    sliderMedia = List.from(json['slider_media'])
        .map((e) => SliderMedia.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['slider'] = slider!.toJson();
    _data['slider_media'] = sliderMedia!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Slider {
  Slider({
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

  Slider.fromJson(Map<String, dynamic> json) {
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

class SliderMedia {
  SliderMedia({
    required this.id,
    required this.sliderId,
    required this.mediaUrl,
    required this.thumbMediaUrl,
    required this.createdAtFormatted,
  });
  late final int id;
  late final int sliderId;
  late final String mediaUrl;
  late final String thumbMediaUrl;
  late final String createdAtFormatted;

  SliderMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sliderId = json['slider_id'];
    mediaUrl = json['media_url'];
    thumbMediaUrl = json['thumb_media_url'];
    createdAtFormatted = json['created_at_formatted'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['slider_id'] = sliderId;
    _data['media_url'] = mediaUrl;
    _data['thumb_media_url'] = thumbMediaUrl;
    _data['created_at_formatted'] = createdAtFormatted;
    return _data;
  }
}
