class Log {
  int? id;
  String? details;
  int? orderId;
  int? storeId;
  int? userId;
  dynamic productOrderId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? orderProductsSnapId;

  Log({
    this.id,
    this.details,
    this.orderId,
    this.storeId,
    this.userId,
    this.productOrderId,
    this.createdAt,
    this.updatedAt,
    this.orderProductsSnapId,
  });

  factory Log.fromJson(Map<String, dynamic> json) => Log(
        id: json['id'] as int?,
        details: json['details'] as String?,
        orderId: json['order_id'] as int?,
        storeId: json['store_id'] as int?,
        userId: json['user_id'] as int?,
        productOrderId: json['product_order_id'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        orderProductsSnapId: json['order_products_snap_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'details': details,
        'order_id': orderId,
        'store_id': storeId,
        'user_id': userId,
        'product_order_id': productOrderId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'order_products_snap_id': orderProductsSnapId,
      };
}
