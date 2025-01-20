import 'orders.dart';

class AllOrdersModel {
  Orders? orders;

  AllOrdersModel({this.orders});

  factory AllOrdersModel.fromJson(Map<String, dynamic> json) {
    return AllOrdersModel(
      orders: json['orders'] == null
          ? null
          : Orders.fromJson(json['orders'] as Map<String, dynamic>),
    );
  }
}
