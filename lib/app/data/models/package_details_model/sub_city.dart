class SubCity {
  int? id;
  String? name;

  SubCity({this.id, this.name});

  factory SubCity.fromJson(Map<String, dynamic> json) => SubCity(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
