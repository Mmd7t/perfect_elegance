import 'datum.dart';

class StoreOrders {
  int? currentPage;
  List<Datum> data;
  int? from;
  int? lastPage;
  int? perPage;
  int? to;
  int? total;

  StoreOrders({
    this.currentPage,
    this.data = const [],
    this.from,
    this.lastPage,
    this.perPage,
    this.to,
    this.total,
  });

  factory StoreOrders.fromJson(Map<String, dynamic> json) => StoreOrders(
        currentPage: json['current_page'] as int?,
        data: (json['data'] as List<dynamic>)
            .map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        from: json['from'] as int?,
        lastPage: json['last_page'] as int?,
        perPage: json['per_page'] as int?,
        to: json['to'] as int?,
        total: json['total'] as int?,
      );
}
