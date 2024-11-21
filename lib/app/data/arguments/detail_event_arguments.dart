class DetailEventArguments {
  int id;

  DetailEventArguments({
    required this.id,
  });

  factory DetailEventArguments.fromJson(Map<String, dynamic> json) =>
      DetailEventArguments(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
