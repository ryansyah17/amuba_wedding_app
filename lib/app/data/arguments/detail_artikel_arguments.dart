class DetailArtikelArguments {
  int id;

  DetailArtikelArguments({
    required this.id,
  });

  factory DetailArtikelArguments.fromJson(Map<String, dynamic> json) =>
      DetailArtikelArguments(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
