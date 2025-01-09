import 'products.dart';
import 'store.dart';

class ProductsIndexModel {
  Products? products;
  Store? store;

  ProductsIndexModel({this.products, this.store});

  factory ProductsIndexModel.fromJson(Map<String, dynamic> json) {
    return ProductsIndexModel(
      products: json['products'] == null
          ? null
          : Products.fromJson(json['products'] as Map<String, dynamic>),
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'products': products?.toJson(),
        'store': store?.toJson(),
      };
}
