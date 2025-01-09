import 'pivot.dart';

class Category {
  int? id;
  String? name;
  String? sizesList;
  Pivot? pivot;
  List<dynamic>? sizes;

  Category({this.id, this.name, this.sizesList, this.pivot, this.sizes});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        sizesList: json['SizesList'] as String?,
        pivot: json['pivot'] == null
            ? null
            : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
        sizes: json['sizes'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'SizesList': sizesList,
        'pivot': pivot?.toJson(),
        'sizes': sizes,
      };
}
