class HomeModel {
  double? storeBalance;
  int? newOrders;
  int? ongoingOrders;
  int? pendingOrdersCount;
  int? underSattelmentProductOrders;
  List<dynamic>? salesData;

  HomeModel({
    this.storeBalance,
    this.newOrders,
    this.ongoingOrders,
    this.pendingOrdersCount,
    this.underSattelmentProductOrders,
    this.salesData,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        storeBalance: (json['store_balance'] as num?)?.toDouble(),
        newOrders: json['new_orders'] as int?,
        ongoingOrders: json['ongoing_orders'] as int?,
        pendingOrdersCount: json['pending_orders_count'] as int?,
        underSattelmentProductOrders:
            json['under_sattelment_product_orders'] as int?,
        salesData: json['salesData'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'store_balance': storeBalance,
        'new_orders': newOrders,
        'ongoing_orders': ongoingOrders,
        'pending_orders_count': pendingOrdersCount,
        'under_sattelment_product_orders': underSattelmentProductOrders,
        'salesData': salesData,
      };
}
