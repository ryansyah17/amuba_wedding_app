class DetailBannerPromosiArguments {
  int id;

  DetailBannerPromosiArguments({
    required this.id,
  });

  factory DetailBannerPromosiArguments.fromJson(Map<String, dynamic> json) =>
      DetailBannerPromosiArguments(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
