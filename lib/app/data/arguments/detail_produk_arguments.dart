class DetailProdukArguments {
  int id;

  DetailProdukArguments({
    required this.id,
  });

  factory DetailProdukArguments.fromJson(Map<String, dynamic> json) =>
      DetailProdukArguments(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
