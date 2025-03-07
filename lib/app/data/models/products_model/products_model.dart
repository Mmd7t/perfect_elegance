import 'product.dart';

class ProductsModel {
  List<SalesProduct> products;

  ProductsModel({this.products = const []});

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        products: (json['products'] as List<dynamic>)
            .map((e) => SalesProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'products': products.map((e) => e.toJson()).toList(),
      };
}
