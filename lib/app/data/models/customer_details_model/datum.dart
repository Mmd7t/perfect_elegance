import 'product_order.dart';

class Datum {
  int? id;
  int? orderId;
  int? userId;
  int? storeId;
  int? customerId;
  int? qty;
  String? totalPrice;
  dynamic address;
  dynamic notes;
  dynamic hint;
  dynamic stikerNotes;
  String? cityId;
  String? subCityId;
  int? statusId;
  dynamic noneDeliveryReason;
  dynamic noneDeliveryReasonAt;
  int? urgent;
  int? ePaid;
  int? hasDeposit;
  int? depositPaid;
  dynamic tylncUrl;
  String? createDate;
  String? shipmentPrice;
  int? cancelPurchasing;
  String? fullPrice;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? inStoreProductOrdersCount;
  int? sameCustomerOrdersCount;
  dynamic customerLevel;
  String? addressDetailes;
  int? completeProductOrdersCount;
  bool? isSettled;
  int? underSettlementCount;
  int? returnedCount;
  int? onGoingProductOrdersCount;
  List<dynamic>? inStoreProductOrdersCountPurchasesList;
  List<dynamic>? waitingDeliveryProductOrdersPurchasesList;
  String? code;
  int? waitingDeliveryProductOrdersCount;
  int? shipmentProductOrdersCount;
  int? readyProductOrdersCount;
  List<ProductOrder>? productOrders;

  Datum({
    this.id,
    this.orderId,
    this.userId,
    this.storeId,
    this.customerId,
    this.qty,
    this.totalPrice,
    this.address,
    this.notes,
    this.hint,
    this.stikerNotes,
    this.cityId,
    this.subCityId,
    this.statusId,
    this.noneDeliveryReason,
    this.noneDeliveryReasonAt,
    this.urgent,
    this.ePaid,
    this.hasDeposit,
    this.depositPaid,
    this.tylncUrl,
    this.createDate,
    this.shipmentPrice,
    this.cancelPurchasing,
    this.fullPrice,
    this.createdAt,
    this.updatedAt,
    this.inStoreProductOrdersCount,
    this.sameCustomerOrdersCount,
    this.customerLevel,
    this.addressDetailes,
    this.completeProductOrdersCount,
    this.isSettled,
    this.underSettlementCount,
    this.returnedCount,
    this.onGoingProductOrdersCount,
    this.inStoreProductOrdersCountPurchasesList,
    this.waitingDeliveryProductOrdersPurchasesList,
    this.code,
    this.waitingDeliveryProductOrdersCount,
    this.shipmentProductOrdersCount,
    this.readyProductOrdersCount,
    this.productOrders,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        orderId: json['orderId'] as int?,
        userId: json['user_id'] as int?,
        storeId: json['store_id'] as int?,
        customerId: json['customer_id'] as int?,
        qty: json['qty'] as int?,
        totalPrice: json['total_price'].toString(),
        address: json['address'] as dynamic,
        notes: json['notes'] as dynamic,
        hint: json['hint'] as dynamic,
        stikerNotes: json['stiker_notes'] as dynamic,
        cityId: json['city_id'] as String?,
        subCityId: json['sub_city_id'] as String?,
        statusId: json['status_id'] as int?,
        noneDeliveryReason: json['none_delivery_reason'] as dynamic,
        noneDeliveryReasonAt: json['none_delivery_reason_at'] as dynamic,
        urgent: json['urgent'] as int?,
        ePaid: json['e_paid'] as int?,
        hasDeposit: json['has_deposit'] as int?,
        depositPaid: json['deposit_paid'] as int?,
        tylncUrl: json['tylnc_url'] as dynamic,
        createDate: json['create_date'] as String?,
        shipmentPrice: json['shipment_price'].toString(),
        cancelPurchasing: json['cancelPurchasing'] as int?,
        fullPrice: json['full_price'].toString(),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        inStoreProductOrdersCount: json['InStoreProductOrdersCount'] as int?,
        sameCustomerOrdersCount: json['SameCustomerOrdersCount'] as int?,
        customerLevel: json['customer_level'] as dynamic,
        addressDetailes: json['AddressDetailes'] as String?,
        completeProductOrdersCount: json['CompleteProductOrdersCount'] as int?,
        isSettled: json['IsSettled'] as bool?,
        underSettlementCount: json['UnderSettlementCount'] as int?,
        returnedCount: json['ReturnedCount'] as int?,
        onGoingProductOrdersCount: json['OnGoingProductOrdersCount'] as int?,
        inStoreProductOrdersCountPurchasesList:
            json['InStoreProductOrdersCountPurchasesList'] as List<dynamic>?,
        waitingDeliveryProductOrdersPurchasesList:
            json['WaitingDeliveryProductOrdersPurchasesList'] as List<dynamic>?,
        code: json['code'] as String?,
        waitingDeliveryProductOrdersCount:
            json['WaitingDeliveryProductOrdersCount'] as int?,
        shipmentProductOrdersCount: json['ShipmentProductOrdersCount'] as int?,
        readyProductOrdersCount: json['ReadyProductOrdersCount'] as int?,
        productOrders: (json['product_orders'] as List<dynamic>?)
            ?.map((e) => ProductOrder.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'orderId': orderId,
        'user_id': userId,
        'store_id': storeId,
        'customer_id': customerId,
        'qty': qty,
        'total_price': totalPrice,
        'address': address,
        'notes': notes,
        'hint': hint,
        'stiker_notes': stikerNotes,
        'city_id': cityId,
        'sub_city_id': subCityId,
        'status_id': statusId,
        'none_delivery_reason': noneDeliveryReason,
        'none_delivery_reason_at': noneDeliveryReasonAt,
        'urgent': urgent,
        'e_paid': ePaid,
        'has_deposit': hasDeposit,
        'deposit_paid': depositPaid,
        'tylnc_url': tylncUrl,
        'create_date': createDate,
        'shipment_price': shipmentPrice,
        'cancelPurchasing': cancelPurchasing,
        'full_price': fullPrice,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'InStoreProductOrdersCount': inStoreProductOrdersCount,
        'SameCustomerOrdersCount': sameCustomerOrdersCount,
        'customer_level': customerLevel,
        'AddressDetailes': addressDetailes,
        'CompleteProductOrdersCount': completeProductOrdersCount,
        'IsSettled': isSettled,
        'UnderSettlementCount': underSettlementCount,
        'ReturnedCount': returnedCount,
        'OnGoingProductOrdersCount': onGoingProductOrdersCount,
        'InStoreProductOrdersCountPurchasesList':
            inStoreProductOrdersCountPurchasesList,
        'WaitingDeliveryProductOrdersPurchasesList':
            waitingDeliveryProductOrdersPurchasesList,
        'code': code,
        'WaitingDeliveryProductOrdersCount': waitingDeliveryProductOrdersCount,
        'ShipmentProductOrdersCount': shipmentProductOrdersCount,
        'ReadyProductOrdersCount': readyProductOrdersCount,
        'product_orders': productOrders?.map((e) => e.toJson()).toList(),
      };
}
