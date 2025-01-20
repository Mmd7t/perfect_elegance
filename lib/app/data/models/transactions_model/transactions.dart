import 'datum.dart';

class Transactions {
  int? currentPage;
  List<TransactionDatum>? data;
  int? lastPage;
  int? perPage;
  int? to;
  int? total;

  Transactions({
    this.currentPage,
    this.data,
    this.lastPage,
    this.perPage,
    this.to,
    this.total,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        currentPage: json['current_page'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => TransactionDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
        lastPage: json['last_page'] as int?,
        perPage: json['per_page'] as int?,
        to: json['to'] as int?,
        total: json['total'] as int?,
      );
}
