import 'packages.dart';

class PackagesModel {
  Packages? packages;

  PackagesModel({this.packages});

  factory PackagesModel.fromJson(Map<String, dynamic> json) => PackagesModel(
        packages: json['packages'] == null
            ? null
            : Packages.fromJson(json['packages'] as Map<String, dynamic>),
      );
}
