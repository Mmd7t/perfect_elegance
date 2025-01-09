import 'pivot.dart';

class Gender {
  int? id;
  String? nameAr;
  Pivot? pivot;

  Gender({this.id, this.nameAr, this.pivot});

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json['id'] as int?,
        nameAr: json['name_ar'] as String?,
        pivot: json['pivot'] == null
            ? null
            : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name_ar': nameAr,
        'pivot': pivot?.toJson(),
      };
}
