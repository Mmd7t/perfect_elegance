import 'products.dart';

class ReturnsModel {
  Products? products;

  ReturnsModel({this.products});

  factory ReturnsModel.fromJson(Map<String, dynamic> json) => ReturnsModel(
        products: json['products'] == null
            ? null
            : Products.fromJson(json['products'] as Map<String, dynamic>),
      );
}
