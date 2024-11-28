class DetailMotorArguments {
  int id;

  DetailMotorArguments({
    required this.id,
  });

  factory DetailMotorArguments.fromJson(Map<String, dynamic> json) =>
      DetailMotorArguments(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
