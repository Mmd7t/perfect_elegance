class ProductCardModel {
  final int? id;
  final String? sku;
  final String? name;
  final int? qty;
  final double? dollarPurchasingPrice;
  final double? dinarSellingPrice;
  double? totalPrice;
  final String? size;
  final String? color;

  ProductCardModel({
    this.id,
    this.sku,
    this.name,
    this.qty,
    this.dollarPurchasingPrice,
    this.dinarSellingPrice,
    this.totalPrice,
    this.size,
    this.color,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'name': name,
      'qty': qty,
      'dollar_purchasing_price': dollarPurchasingPrice,
      'dinar_selling_price': dinarSellingPrice,
      'total_price': totalPrice,
      'size': size,
      'color': color,
    };
  }

  ProductCardModel copyWith({
    int? id,
    String? sku,
    String? name,
    int? qty,
    double? dollarPurchasingPrice,
    double? dinarSellingPrice,
    double? totalPrice,
    String? size,
    String? color,
  }) {
    return ProductCardModel(
      id: id ?? this.id,
      sku: sku ?? this.sku,
      name: name ?? this.name,
      qty: qty ?? this.qty,
      dollarPurchasingPrice:
          dollarPurchasingPrice ?? this.dollarPurchasingPrice,
      dinarSellingPrice: dinarSellingPrice ?? this.dinarSellingPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      size: size ?? this.size,
      color: color ?? this.color,
    );
  }
}
