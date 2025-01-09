import 'product_order.dart';
import 'user.dart';

class OrderModel {
  int? id;
  User? user;
  String? status;
  String? city;
  dynamic address;
  int? productsCount;
  int? totalPrice;
  int? qty;
  List<ProductOrder>? productOrders;

  OrderModel({
    this.id,
    this.user,
    this.status,
    this.city,
    this.address,
    this.productsCount,
    this.totalPrice,
    this.qty,
    this.productOrders,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'] as int?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        status: json['status'] as String?,
        city: json['city'] as String?,
        address: json['address'] as dynamic,
        productsCount: json['products_count'] as int?,
        totalPrice: json['total_price'] as int?,
        qty: json['qty'] as int?,
        productOrders: (json['product_orders'] as List<dynamic>?)
            ?.map((e) => ProductOrder.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user?.toJson(),
        'status': status,
        'city': city,
        'address': address,
        'products_count': productsCount,
        'total_price': totalPrice,
        'qty': qty,
        'product_orders': productOrders?.map((e) => e.toJson()).toList(),
      };
}
