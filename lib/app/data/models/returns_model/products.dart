import 'datum.dart';
import 'meta.dart';

class Products {
  List<ReturnsDatum>? data;
  Meta? meta;

  Products({this.data, this.meta});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => ReturnsDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );
}
