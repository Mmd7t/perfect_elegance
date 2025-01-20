import 'datum.dart';
import 'meta.dart';

class Packages {
  List<PackageDatum> data;
  Meta? meta;

  Packages({this.data = const [], this.meta});

  factory Packages.fromJson(Map<String, dynamic> json) => Packages(
        data: (json['data'] as List<dynamic>)
            .map((e) => PackageDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );
}
