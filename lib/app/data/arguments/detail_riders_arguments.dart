class DetailRidersArguments {
  int id;

  DetailRidersArguments({
    required this.id,
  });

  factory DetailRidersArguments.fromJson(Map<String, dynamic> json) =>
      DetailRidersArguments(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
