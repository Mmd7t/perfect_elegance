import 'link.dart';

class Polices {
  int? currentPage;
  List<dynamic>? data;
  String? firstPageUrl;
  dynamic from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  dynamic to;
  int? total;

  Polices({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Polices.fromJson(Map<String, dynamic> json) => Polices(
        currentPage: json['current_page'] as int?,
        data: json['data'] as List<dynamic>?,
        firstPageUrl: json['first_page_url'] as String?,
        from: json['from'] as dynamic,
        lastPage: json['last_page'] as int?,
        lastPageUrl: json['last_page_url'] as String?,
        links: (json['links'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
            .toList(),
        nextPageUrl: json['next_page_url'] as dynamic,
        path: json['path'] as String?,
        perPage: json['per_page'] as int?,
        prevPageUrl: json['prev_page_url'] as dynamic,
        to: json['to'] as dynamic,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'data': data,
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page': lastPage,
        'last_page_url': lastPageUrl,
        'links': links?.map((e) => e.toJson()).toList(),
        'next_page_url': nextPageUrl,
        'path': path,
        'per_page': perPage,
        'prev_page_url': prevPageUrl,
        'to': to,
        'total': total,
      };
}
