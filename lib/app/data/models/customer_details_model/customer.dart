import 'store.dart';

class Customer {
  int? id;
  int? userId;
  int? isPrime;
  String? name;
  String? phone;
  String? phone2;
  String? cityName;
  int? cityId;
  int? subCityId;
  String? subCityName;
  dynamic address;
  dynamic socialType;
  dynamic socialLink;
  dynamic email;
  String? deliveryProvider;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? active;
  dynamic level;
  int? ordersCount;
  String? deliveryServiceProvider;
  List<dynamic>? logs;
  List<Store>? stores;

  Customer({
    this.id,
    this.userId,
    this.isPrime,
    this.name,
    this.phone,
    this.phone2,
    this.cityName,
    this.cityId,
    this.subCityId,
    this.subCityName,
    this.address,
    this.socialType,
    this.socialLink,
    this.email,
    this.deliveryProvider,
    this.createdAt,
    this.updatedAt,
    this.active,
    this.level,
    this.ordersCount,
    this.deliveryServiceProvider,
    this.logs,
    this.stores,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        isPrime: json['is_prime'] as int?,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        phone2: json['phone2'] as String?,
        cityName: json['city_name'] as String?,
        cityId: json['city_id'] as int?,
        subCityId: json['sub_city_id'] as int?,
        subCityName: json['sub_city_name'] as String?,
        address: json['address'] as dynamic,
        socialType: json['social_type'] as dynamic,
        socialLink: json['social_link'] as dynamic,
        email: json['email'] as dynamic,
        deliveryProvider: json['delivery_provider'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        active: json['active'] as int?,
        level: json['level'] as dynamic,
        ordersCount: json['orders_count'] as int?,
        deliveryServiceProvider: json['delivery_service_provider'] as String?,
        logs: json['logs'] as List<dynamic>?,
        stores: (json['stores'] as List<dynamic>?)
            ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'is_prime': isPrime,
        'name': name,
        'phone': phone,
        'phone2': phone2,
        'city_name': cityName,
        'city_id': cityId,
        'sub_city_id': subCityId,
        'sub_city_name': subCityName,
        'address': address,
        'social_type': socialType,
        'social_link': socialLink,
        'email': email,
        'delivery_provider': deliveryProvider,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'active': active,
        'level': level,
        'orders_count': ordersCount,
        'delivery_service_provider': deliveryServiceProvider,
        'logs': logs,
        'stores': stores?.map((e) => e.toJson()).toList(),
      };
}
