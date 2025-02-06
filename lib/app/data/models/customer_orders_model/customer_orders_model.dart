import 'orders.dart';

class CustomerOrdersModel {
  Orders? orders;

  CustomerOrdersModel({this.orders});

  factory CustomerOrdersModel.fromJson(Map<String, dynamic> json) {
    return CustomerOrdersModel(
      orders: json['orders'] == null
          ? null
          : Orders.fromJson(json['orders'] as Map<String, dynamic>),
    );
  }
}
