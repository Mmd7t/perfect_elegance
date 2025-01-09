class Status {
  int? id;
  String? name;
  String? color;
  dynamic createdAt;
  dynamic updatedAt;

  Status({this.id, this.name, this.color, this.createdAt, this.updatedAt});

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json['id'] as int?,
        name: json['name'] as String?,
        color: json['color'] as String?,
        createdAt: json['created_at'] as dynamic,
        updatedAt: json['updated_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'color': color,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
