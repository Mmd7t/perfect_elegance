class Pivot {
  int? customerId;
  int? storeId;

  Pivot({this.customerId, this.storeId});

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        customerId: json['customer_id'] as int?,
        storeId: json['store_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'customer_id': customerId,
        'store_id': storeId,
      };
}
