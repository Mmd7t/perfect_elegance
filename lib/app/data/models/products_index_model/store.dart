import 'category.dart';
import 'gender.dart';

class Store {
  int? id;
  int? totalOrders;
  int? totalProductOrders;
  List<dynamic>? brands;
  List<Category>? categories;
  List<Gender>? genders;

  Store({
    this.id,
    this.totalOrders,
    this.totalProductOrders,
    this.brands,
    this.categories,
    this.genders,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json['id'] as int?,
        totalOrders: json['total_orders'] as int?,
        totalProductOrders: json['total_product_orders'] as int?,
        brands: json['brands'] as List<dynamic>?,
        categories: (json['categories'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
        genders: (json['genders'] as List<dynamic>?)
            ?.map((e) => Gender.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'total_orders': totalOrders,
        'total_product_orders': totalProductOrders,
        'brands': brands,
        'categories': categories?.map((e) => e.toJson()).toList(),
        'genders': genders?.map((e) => e.toJson()).toList(),
      };
}
