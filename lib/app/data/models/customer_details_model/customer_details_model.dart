import 'customer.dart';
import 'store_orders.dart';

class CustomerDetailsModel {
  Customer? customer;
  StoreOrders? storeOrders;

  CustomerDetailsModel({
    this.customer,
    this.storeOrders,
  });

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) {
    return CustomerDetailsModel(
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      storeOrders: json['store_orders'] == null
          ? null
          : StoreOrders.fromJson(json['store_orders'] as Map<String, dynamic>),
    );
  }
}
