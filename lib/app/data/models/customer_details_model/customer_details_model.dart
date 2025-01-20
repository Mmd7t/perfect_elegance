import 'another_store_orders.dart';
import 'customer.dart';
import 'store_orders.dart';

class CustomerDetailsModel {
  Customer? customer;
  AnotherStoreOrders? anotherStoreOrders;
  StoreOrders? storeOrders;

  CustomerDetailsModel({
    this.customer,
    this.anotherStoreOrders,
    this.storeOrders,
  });

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) {
    return CustomerDetailsModel(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      anotherStoreOrders: json['another_store_orders'] == null
          ? null
          : AnotherStoreOrders.fromJson(
              json['another_store_orders'] as Map<String, dynamic>),
      storeOrders: json['store_orders'] == null
          ? null
          : StoreOrders.fromJson(json['store_orders'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'customer': customer?.toJson(),
        'another_store_orders': anotherStoreOrders?.toJson(),
        'store_orders': storeOrders?.toJson(),
      };
}
