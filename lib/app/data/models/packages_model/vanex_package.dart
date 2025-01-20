import 'data.dart';

class VanexPackage {
  Data? data;

  VanexPackage({this.data});

  factory VanexPackage.fromJson(Map<String, dynamic> json) => VanexPackage(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };
}
