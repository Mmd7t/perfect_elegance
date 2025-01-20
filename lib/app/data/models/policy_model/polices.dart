import 'datum.dart';

class Polices {
  int? currentPage;
  List<PolicyDatum> data;
  int? from;
  int? lastPage;
  int? to;
  int? total;

  Polices({
    this.currentPage,
    this.data = const [],
    this.from,
    this.lastPage,
    this.to,
    this.total,
  });

  factory Polices.fromJson(Map<String, dynamic> json) => Polices(
        currentPage: json['current_page'] as int?,
        data: (json['data'] as List<dynamic>)
            .map((e) => PolicyDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
        from: json['from'] as int?,
        lastPage: json['last_page'] as int?,
        to: json['to'] as int?,
        total: json['total'] as int?,
      );
}
