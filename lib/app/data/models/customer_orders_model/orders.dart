import 'datum.dart';

class Orders {
  int? currentPage;
  List<CustomerOrderDatum>? data;
  int? from;
  int? lastPage;
  int? perPage;
  int? to;
  int? total;

  Orders({
    this.currentPage,
    this.data,
    this.from,
    this.lastPage,
    this.perPage,
    this.to,
    this.total,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        currentPage: json['current_page'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => CustomerOrderDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
        from: json['from'] as int?,
        lastPage: json['last_page'] as int?,
        perPage: json['per_page'] as int?,
        to: json['to'] as int?,
        total: json['total'] as int?,
      );
}
