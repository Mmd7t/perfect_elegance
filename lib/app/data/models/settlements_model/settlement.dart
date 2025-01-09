class Settlement {
  int? id;
  int? settlementCode;
  int? totalSettlementAmount;
  int? totalDinarSellingPrice;
  double? totalDollarPurchasingPrice;
  double? totalDinarPurchasingPrice;
  double? totalExternalWeight;
  double? advertisingCost;
  int? totalPackagePreparationCost;
  double? netStoreReceivable;
  String? createdAt;

  Settlement({
    this.id,
    this.settlementCode,
    this.totalSettlementAmount,
    this.totalDinarSellingPrice,
    this.totalDollarPurchasingPrice,
    this.totalDinarPurchasingPrice,
    this.totalExternalWeight,
    this.advertisingCost,
    this.totalPackagePreparationCost,
    this.netStoreReceivable,
    this.createdAt,
  });

  factory Settlement.fromJson(Map<String, dynamic> json) => Settlement(
        id: json['id'] as int?,
        settlementCode: json['settlement_code'] as int?,
        totalSettlementAmount: json['total_settlement_amount'] as int?,
        totalDinarSellingPrice: json['total_dinar_selling_price'] as int?,
        totalDollarPurchasingPrice:
            (json['total_dollar_purchasing_price'] as num?)?.toDouble(),
        totalDinarPurchasingPrice:
            (json['total_dinar_purchasing_price'] as num?)?.toDouble(),
        totalExternalWeight:
            (json['total_external_weight'] as num?)?.toDouble(),
        advertisingCost: (json['advertising_cost'] as num?)?.toDouble(),
        totalPackagePreparationCost:
            json['total_package_preparation_cost'] as int?,
        netStoreReceivable: (json['net_store_receivable'] as num?)?.toDouble(),
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'settlement_code': settlementCode,
        'total_settlement_amount': totalSettlementAmount,
        'total_dinar_selling_price': totalDinarSellingPrice,
        'total_dollar_purchasing_price': totalDollarPurchasingPrice,
        'total_dinar_purchasing_price': totalDinarPurchasingPrice,
        'total_external_weight': totalExternalWeight,
        'advertising_cost': advertisingCost,
        'total_package_preparation_cost': totalPackagePreparationCost,
        'net_store_receivable': netStoreReceivable,
        'created_at': createdAt,
      };
}
