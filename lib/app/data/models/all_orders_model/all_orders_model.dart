import 'customer.dart';
import 'orders.dart';

class AllOrdersModel {
  Orders? orders;
  int? storeId;
  List<Customer>? customers;

  AllOrdersModel({this.orders, this.storeId, this.customers});

  factory AllOrdersModel.fromJson(Map<String, dynamic> json) {
    return AllOrdersModel(
      orders: json['orders'] == null
          ? null
          : Orders.fromJson(json['orders'] as Map<String, dynamic>),
      storeId: json['store_id'] as int?,
      customers: (json['customers'] as List<dynamic>?)
          ?.map((e) => Customer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'orders': orders?.toJson(),
        'store_id': storeId,
        'customers': customers?.map((e) => e.toJson()).toList(),
      };
}
