class ProductOrder {
  int? id;
  String? sku;
  String? name;
  String? size;
  String? colorName;
  dynamic colorHex;
  String? status;
  String? dinarSellingPrice;
  String? dollarPurchasingPrice;
  dynamic shippingCode;
  dynamic purchaseDate;
  dynamic settlementDate;
  String? purchasesLink;

  ProductOrder({
    this.id,
    this.sku,
    this.name,
    this.size,
    this.colorName,
    this.colorHex,
    this.status,
    this.dinarSellingPrice,
    this.dollarPurchasingPrice,
    this.shippingCode,
    this.purchaseDate,
    this.settlementDate,
    this.purchasesLink,
  });

  factory ProductOrder.fromJson(Map<String, dynamic> json) => ProductOrder(
        id: json['id'] as int?,
        sku: json['sku'] as String?,
        name: json['name'] as String?,
        size: json['size'] as String?,
        colorName: json['color_name'] as String?,
        colorHex: json['color_hex'] as dynamic,
        status: json['status'] as String?,
        dinarSellingPrice: json['dinar_selling_price'].toString(),
        dollarPurchasingPrice: json['dollar_purchasing_price'].toString(),
        shippingCode: json['shipping_code'] as dynamic,
        purchaseDate: json['purchase_date'] as dynamic,
        settlementDate: json['settlement_date'] as dynamic,
        purchasesLink: json['purchases_link'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sku': sku,
        'name': name,
        'size': size,
        'color_name': colorName,
        'color_hex': colorHex,
        'status': status,
        'dinar_selling_price': dinarSellingPrice,
        'dollar_purchasing_price': dollarPurchasingPrice,
        'shipping_code': shippingCode,
        'purchase_date': purchaseDate,
        'settlement_date': settlementDate,
        'purchases_link': purchasesLink,
      };
}
