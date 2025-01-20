class PackageType {
  int? id;
  String? name;
  String? nameEn;
  int? active;
  int? parent;

  PackageType({this.id, this.name, this.nameEn, this.active, this.parent});

  factory PackageType.fromJson(Map<String, dynamic> json) => PackageType(
        id: json['id'] as int?,
        name: json['name'] as String?,
        nameEn: json['name_en'] as String?,
        active: json['active'] as int?,
        parent: json['parent'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_en': nameEn,
        'active': active,
        'parent': parent,
      };
}
