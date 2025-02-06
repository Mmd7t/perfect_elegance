import 'product.dart';

class ProductModel {
  Product? product;

  ProductModel({this.product});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'product': product?.toJson(),
      };
}
