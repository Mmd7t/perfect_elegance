import 'datum.dart';
import 'meta.dart';

class Orders {
  List<OrderDatum>? data;
  Meta? meta;

  Orders({this.data, this.meta});

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => OrderDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );
}
