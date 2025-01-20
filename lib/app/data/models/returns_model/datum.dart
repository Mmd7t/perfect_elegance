class ReturnsDatum {
  int? id;
  dynamic sku;
  String? name;
  String? size;
  String? status;
  int? dinarSellingPrice;
  double? dollarPurchasingPrice;
  String? shippingCode;
  String? purchaseDate;
  dynamic settlementDate;
  dynamic purchasesLink;

  ReturnsDatum({
    this.id,
    this.sku,
    this.name,
    this.size,
    this.status,
    this.dinarSellingPrice,
    this.dollarPurchasingPrice,
    this.shippingCode,
    this.purchaseDate,
    this.settlementDate,
    this.purchasesLink,
  });

  factory ReturnsDatum.fromJson(Map<String, dynamic> json) => ReturnsDatum(
        id: json['id'] as int?,
        sku: json['sku'] as dynamic,
        name: json['name'] as String?,
        size: json['size'] as String?,
        status: json['status'] as String?,
        dinarSellingPrice: json['dinar_selling_price'] as int?,
        dollarPurchasingPrice:
            (json['dollar_purchasing_price'] as num?)?.toDouble(),
        shippingCode: json['shipping_code'] as String?,
        purchaseDate: json['purchase_date'] as String?,
        settlementDate: json['settlement_date'] as dynamic,
        purchasesLink: json['purchases_link'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sku': sku,
        'name': name,
        'size': size,
        'status': status,
        'dinar_selling_price': dinarSellingPrice,
        'dollar_purchasing_price': dollarPurchasingPrice,
        'shipping_code': shippingCode,
        'purchase_date': purchaseDate,
        'settlement_date': settlementDate,
        'purchases_link': purchasesLink,
      };
}
