import 'data.dart';

class VanexPackage {
  VanexData? data;

  VanexPackage({this.data});

  factory VanexPackage.fromJson(Map<String, dynamic> json) => VanexPackage(
        data: json['data'] == null
            ? null
            : VanexData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };
}
