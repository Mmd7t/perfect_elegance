class AllStoresModel {
  int? id;
  String? name;
  int? totalOrders;
  int? totalProductOrders;
  bool? isVerified;

  AllStoresModel({
    this.id,
    this.name,
    this.totalOrders,
    this.totalProductOrders,
    this.isVerified,
  });

  factory AllStoresModel.fromJson(Map<String, dynamic> json) {
    return AllStoresModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      totalOrders: json['total_orders'] as int?,
      totalProductOrders: json['total_product_orders'] as int?,
      isVerified: json['is_verified'] as bool?,
    );
  }
}
