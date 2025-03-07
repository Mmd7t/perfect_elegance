import 'package:perfect_elegance/app/data/models/products_model/sales_product_data_model.dart';

class SalesProduct {
  int? id;
  dynamic vanexPackageCode;
  dynamic shippingCode;
  dynamic externalShippingCode;
  dynamic pendingReason;
  dynamic pendedAt;
  dynamic vanexPackageId;
  int? orderId;
  dynamic vanexSettlementId;
  int? productId;
  dynamic brandId;
  int? isPage;
  dynamic variantId;
  dynamic shelfId;
  String? size;
  String? type;
  dynamic purchaseId;
  dynamic packageId;
  String? dollarOldPurchasingPrice;
  double? dollarPurchasingPrice;
  String? dinarOldSellingPrice;
  String? dinarSellingPrice;
  dynamic dollarExchange;
  dynamic sellFactor;
  int? statusId;
  dynamic oldStatusId;
  int? storeId;
  int? quantity;
  String? colorName;
  dynamic colorHex;
  dynamic transactionId;
  dynamic storeTransactionId;
  dynamic settlementId;
  dynamic noneDeliveryReason;
  dynamic noneDeliveryAt;
  dynamic purchaseDate;
  dynamic instoreDate;
  dynamic shipmentDate;
  dynamic assignmentDate;
  dynamic settlementDate;
  dynamic completeDate;
  dynamic storeContinueNotes;
  dynamic storeContinueNotesAt;
  dynamic barcode;
  dynamic sku;
  dynamic note;
  dynamic returnId;
  dynamic returnAt;
  dynamic returnUserId;
  dynamic returnTransactionId;
  String? createDate;
  dynamic lastChangePriceRequest;
  dynamic carelessBecuase;
  dynamic purchaseDeliveryId;
  int? isFreeze;
  int? refundFromSettlement;
  dynamic carelessAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  dynamic storeDeliveryId;
  dynamic storeInventoryId;
  dynamic pendingPurchaseReasonId;
  int? aedExchange;
  int? isPublished;
  dynamic publishedAt;
  dynamic sheinImage;
  dynamic description;
  dynamic image;
  dynamic categoryId;
  int? readyToSale;
  dynamic dinarSillingPrice;
  String? dinerDiscountPrice;
  String? logPrefix;
  SalesProductDataModel? product;

  SalesProduct({
    this.id,
    this.vanexPackageCode,
    this.shippingCode,
    this.externalShippingCode,
    this.pendingReason,
    this.pendedAt,
    this.vanexPackageId,
    this.orderId,
    this.vanexSettlementId,
    this.productId,
    this.brandId,
    this.isPage,
    this.variantId,
    this.shelfId,
    this.size,
    this.type,
    this.purchaseId,
    this.packageId,
    this.dollarOldPurchasingPrice,
    this.dollarPurchasingPrice,
    this.dinarOldSellingPrice,
    this.dinarSellingPrice,
    this.dollarExchange,
    this.sellFactor,
    this.statusId,
    this.oldStatusId,
    this.storeId,
    this.quantity,
    this.colorName,
    this.colorHex,
    this.transactionId,
    this.storeTransactionId,
    this.settlementId,
    this.noneDeliveryReason,
    this.noneDeliveryAt,
    this.purchaseDate,
    this.instoreDate,
    this.shipmentDate,
    this.assignmentDate,
    this.settlementDate,
    this.completeDate,
    this.storeContinueNotes,
    this.storeContinueNotesAt,
    this.barcode,
    this.sku,
    this.note,
    this.returnId,
    this.returnAt,
    this.returnUserId,
    this.returnTransactionId,
    this.createDate,
    this.lastChangePriceRequest,
    this.carelessBecuase,
    this.purchaseDeliveryId,
    this.isFreeze,
    this.refundFromSettlement,
    this.carelessAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.storeDeliveryId,
    this.storeInventoryId,
    this.pendingPurchaseReasonId,
    this.aedExchange,
    this.isPublished,
    this.publishedAt,
    this.sheinImage,
    this.description,
    this.image,
    this.categoryId,
    this.readyToSale,
    this.dinarSillingPrice,
    this.dinerDiscountPrice,
    this.logPrefix,
    this.product,
  });

  factory SalesProduct.fromJson(Map<String, dynamic> json) => SalesProduct(
        id: json['id'] as int?,
        vanexPackageCode: json['vanex_package_code'] as dynamic,
        shippingCode: json['shipping_code'] as dynamic,
        externalShippingCode: json['external_shipping_code'] as dynamic,
        pendingReason: json['pending_reason'] as dynamic,
        pendedAt: json['pended_at'] as dynamic,
        vanexPackageId: json['vanex_package_id'] as dynamic,
        orderId: json['order_id'] as int?,
        vanexSettlementId: json['vanex_settlement_id'] as dynamic,
        productId: json['product_id'] as int?,
        brandId: json['brand_id'] as dynamic,
        isPage: json['is_page'] as int?,
        variantId: json['variant_id'] as dynamic,
        shelfId: json['shelf_id'] as dynamic,
        size: json['size'] as String?,
        type: json['type'] as String?,
        purchaseId: json['purchase_id'] as dynamic,
        packageId: json['package_id'] as dynamic,
        dollarOldPurchasingPrice:
            json['dollar_old_purchasing_price'].toString(),
        dollarPurchasingPrice:
            (json['dollar_purchasing_price'] as num?)?.toDouble(),
        dinarOldSellingPrice: json['dinar_old_selling_price'].toString(),
        dinarSellingPrice: json['dinar_selling_price'].toString(),
        dollarExchange: json['dollar_exchange'] as dynamic,
        sellFactor: json['sell_factor'] as dynamic,
        statusId: json['status_id'] as int?,
        oldStatusId: json['old_status_id'] as dynamic,
        storeId: json['store_id'] as int?,
        quantity: json['quantity'] as int?,
        colorName: json['color_name'] as String?,
        colorHex: json['color_hex'] as dynamic,
        transactionId: json['transaction_id'] as dynamic,
        storeTransactionId: json['store_transaction_id'] as dynamic,
        settlementId: json['settlement_id'] as dynamic,
        noneDeliveryReason: json['none_delivery_reason'] as dynamic,
        noneDeliveryAt: json['none_delivery_at'] as dynamic,
        purchaseDate: json['purchase_date'] as dynamic,
        instoreDate: json['instore_date'] as dynamic,
        shipmentDate: json['shipment_date'] as dynamic,
        assignmentDate: json['assignment_date'] as dynamic,
        settlementDate: json['settlement_date'] as dynamic,
        completeDate: json['complete_date'] as dynamic,
        storeContinueNotes: json['store_continue_notes'] as dynamic,
        storeContinueNotesAt: json['store_continue_notes_at'] as dynamic,
        barcode: json['barcode'] as dynamic,
        sku: json['sku'] as dynamic,
        note: json['note'] as dynamic,
        returnId: json['return_id'] as dynamic,
        returnAt: json['return_at'] as dynamic,
        returnUserId: json['return_user_id'] as dynamic,
        returnTransactionId: json['return_transaction_id'] as dynamic,
        createDate: json['create_date'] as String?,
        lastChangePriceRequest: json['last_change_price_request'] as dynamic,
        carelessBecuase: json['careless_becuase'] as dynamic,
        purchaseDeliveryId: json['purchase_delivery_id'] as dynamic,
        isFreeze: json['is_freeze'] as int?,
        refundFromSettlement: json['refund_from_settlement'] as int?,
        carelessAt: json['careless_at'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        deletedAt: json['deleted_at'] as dynamic,
        storeDeliveryId: json['store_delivery_id'] as dynamic,
        storeInventoryId: json['store_inventory_id'] as dynamic,
        pendingPurchaseReasonId: json['pending_purchase_reason_id'] as dynamic,
        aedExchange: json['aed_exchange'] as int?,
        isPublished: json['is_published'] as int?,
        publishedAt: json['published_at'] as dynamic,
        sheinImage: json['shein_image'] as dynamic,
        description: json['description'] as dynamic,
        image: json['image'] as dynamic,
        categoryId: json['category_id'] as dynamic,
        readyToSale: json['ready_to_sale'] as int?,
        dinarSillingPrice: json['DinarSillingPrice'] as dynamic,
        dinerDiscountPrice: json['DinerDiscountPrice'] as String?,
        logPrefix: json['LogPrefix'] as String?,
        product: json['product'] == null
            ? null
            : SalesProductDataModel.fromJson(
                json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'vanex_package_code': vanexPackageCode,
        'shipping_code': shippingCode,
        'external_shipping_code': externalShippingCode,
        'pending_reason': pendingReason,
        'pended_at': pendedAt,
        'vanex_package_id': vanexPackageId,
        'order_id': orderId,
        'vanex_settlement_id': vanexSettlementId,
        'product_id': productId,
        'brand_id': brandId,
        'is_page': isPage,
        'variant_id': variantId,
        'shelf_id': shelfId,
        'size': size,
        'type': type,
        'purchase_id': purchaseId,
        'package_id': packageId,
        'dollar_old_purchasing_price': dollarOldPurchasingPrice,
        'dollar_purchasing_price': dollarPurchasingPrice,
        'dinar_old_selling_price': dinarOldSellingPrice,
        'dinar_selling_price': dinarSellingPrice,
        'dollar_exchange': dollarExchange,
        'sell_factor': sellFactor,
        'status_id': statusId,
        'old_status_id': oldStatusId,
        'store_id': storeId,
        'quantity': quantity,
        'color_name': colorName,
        'color_hex': colorHex,
        'transaction_id': transactionId,
        'store_transaction_id': storeTransactionId,
        'settlement_id': settlementId,
        'none_delivery_reason': noneDeliveryReason,
        'none_delivery_at': noneDeliveryAt,
        'purchase_date': purchaseDate,
        'instore_date': instoreDate,
        'shipment_date': shipmentDate,
        'assignment_date': assignmentDate,
        'settlement_date': settlementDate,
        'complete_date': completeDate,
        'store_continue_notes': storeContinueNotes,
        'store_continue_notes_at': storeContinueNotesAt,
        'barcode': barcode,
        'sku': sku,
        'note': note,
        'return_id': returnId,
        'return_at': returnAt,
        'return_user_id': returnUserId,
        'return_transaction_id': returnTransactionId,
        'create_date': createDate,
        'last_change_price_request': lastChangePriceRequest,
        'careless_becuase': carelessBecuase,
        'purchase_delivery_id': purchaseDeliveryId,
        'is_freeze': isFreeze,
        'refund_from_settlement': refundFromSettlement,
        'careless_at': carelessAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
        'store_delivery_id': storeDeliveryId,
        'store_inventory_id': storeInventoryId,
        'pending_purchase_reason_id': pendingPurchaseReasonId,
        'aed_exchange': aedExchange,
        'is_published': isPublished,
        'published_at': publishedAt,
        'shein_image': sheinImage,
        'description': description,
        'image': image,
        'category_id': categoryId,
        'ready_to_sale': readyToSale,
        'DinarSillingPrice': dinarSillingPrice,
        'DinerDiscountPrice': dinerDiscountPrice,
        'LogPrefix': logPrefix,
        'product': product?.toJson(),
      };
}
