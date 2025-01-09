import 'deliveryman.dart';
import 'packages.dart';

class PackagesModel {
  Packages? packages;
  List<Deliveryman>? deliverymen;

  PackagesModel({this.packages, this.deliverymen});

  factory PackagesModel.fromJson(Map<String, dynamic> json) => PackagesModel(
        packages: json['packages'] == null
            ? null
            : Packages.fromJson(json['packages'] as Map<String, dynamic>),
        deliverymen: (json['deliverymen'] as List<dynamic>?)
            ?.map((e) => Deliveryman.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'packages': packages?.toJson(),
        'deliverymen': deliverymen?.map((e) => e.toJson()).toList(),
      };
}
