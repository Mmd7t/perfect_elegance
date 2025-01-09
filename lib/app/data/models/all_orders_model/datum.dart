import 'user.dart';

class Datum {
  int? id;
  User? user;
  String? status;
  String? city;
  dynamic address;
  int? productsCount;

  Datum({
    this.id,
    this.user,
    this.status,
    this.city,
    this.address,
    this.productsCount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        status: json['status'] as String?,
        city: json['city'] as String?,
        address: json['address'] as dynamic,
        productsCount: json['products_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user?.toJson(),
        'status': status,
        'city': city,
        'address': address,
        'products_count': productsCount,
      };
}
