class SizesList {
  int? id;
  String? size;

  SizesList({this.id, this.size});

  factory SizesList.fromJson(Map<String, dynamic> json) => SizesList(
        id: json['id'] as int?,
        size: json['size'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'size': size,
      };
}
