import 'customer.dart';
import 'log.dart';
import 'product_order.dart';
import 'user.dart';

class OrderDetailsModel {
  int? id;
  User? user;
  OrderDetailsCustomer? customer;
  String? status;
  int? statusId;
  String? city;
  dynamic address;
  int? productsCount;
  int? totalPrice;
  int? qty;
  DateTime? createdAt;
  List<ProductOrder> productOrders;
  List<dynamic>? packages;
  List<Log> logs;

  OrderDetailsModel({
    this.id,
    this.user,
    this.customer,
    this.status,
    this.statusId,
    this.city,
    this.address,
    this.productsCount,
    this.totalPrice,
    this.qty,
    this.createdAt,
    this.productOrders = const [],
    this.packages,
    this.logs = const [],
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : OrderDetailsCustomer.fromJson(
              json['customer'] as Map<String, dynamic>),
      status: json['status'] as String?,
      statusId: json['status_id'] as int?,
      city: json['city'] as String?,
      address: json['address'] as dynamic,
      productsCount: json['products_count'] as int?,
      totalPrice: json['total_price'] as int?,
      qty: json['qty'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      productOrders: (json['product_orders'] as List<dynamic>)
          .map((e) => ProductOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      packages: json['packages'] as List<dynamic>?,
      logs: (json['logs'] as List<dynamic>)
          .map((e) => Log.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
