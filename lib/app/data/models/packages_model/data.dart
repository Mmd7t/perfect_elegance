import 'city.dart';
import 'origin.dart';
import 'package_instractions.dart';
import 'package_type.dart';
import 'sender.dart';
import 'status_object.dart';
import 'stock_location.dart';

class Data {
  String? packageCode;
  PackageType? packageType;
  dynamic packageSubType;
  String? reciever;
  String? phone;
  dynamic phoneB;
  String? address;
  int? price;
  int? originPrice;
  int? shippment;
  int? total;
  int? extraSizePrice;
  int? regionCommission;
  String? paymentMethode;
  String? paidBy;
  String? extraSizeBy;
  String? commissionBy;
  int? courierCommunication;
  String? paidByAr;
  String? extraSizeByAr;
  String? commissionByAr;
  String? status;
  StatusObject? statusObject;
  String? createDate;
  dynamic addressCode;
  String? instoreDate;
  String? deliveryDate;
  String? updateDate;
  int? qty;
  int? qtyReturn;
  int? recievedMoney;
  String? description;
  int? nonDeliveryReason;
  String? nonDeliveryText;
  StockLocation? stockLocation;
  int? pkgOrign;
  dynamic stickerNotes;
  int? leangh;
  int? width;
  int? height;
  String? storeReferenceId;
  dynamic map;
  Origin? origin;
  int? breakable;
  int? receiptMoney;
  int? measuringIsAllowed;
  int? partialDelivery;
  int? storageSubscription;
  int? inspectionAllowed;
  int? heatIntolerance;
  int? storeSubSender;
  int? casing;
  dynamic isDeposit;
  dynamic tlyncUrl;
  dynamic lastReconnectAt;
  dynamic lastReconnectStatus;
  dynamic financialTypeAr;
  dynamic financialTypeEn;
  dynamic photo;
  Sender? sender;
  City? city;
  dynamic subCity;
  List<dynamic>? productsPackage;
  int? isFiftyOkay;
  dynamic internationalPackageCode;
  dynamic currencyType;
  dynamic totalAmount;
  DateTime? createdAt;
  DateTime? updatedAt;
  PackageInstractions? packageInstractions;
  dynamic hashid;

  Data({
    this.packageCode,
    this.packageType,
    this.packageSubType,
    this.reciever,
    this.phone,
    this.phoneB,
    this.address,
    this.price,
    this.originPrice,
    this.shippment,
    this.total,
    this.extraSizePrice,
    this.regionCommission,
    this.paymentMethode,
    this.paidBy,
    this.extraSizeBy,
    this.commissionBy,
    this.courierCommunication,
    this.paidByAr,
    this.extraSizeByAr,
    this.commissionByAr,
    this.status,
    this.statusObject,
    this.createDate,
    this.addressCode,
    this.instoreDate,
    this.deliveryDate,
    this.updateDate,
    this.qty,
    this.qtyReturn,
    this.recievedMoney,
    this.description,
    this.nonDeliveryReason,
    this.nonDeliveryText,
    this.stockLocation,
    this.pkgOrign,
    this.stickerNotes,
    this.leangh,
    this.width,
    this.height,
    this.storeReferenceId,
    this.map,
    this.origin,
    this.breakable,
    this.receiptMoney,
    this.measuringIsAllowed,
    this.partialDelivery,
    this.storageSubscription,
    this.inspectionAllowed,
    this.heatIntolerance,
    this.storeSubSender,
    this.casing,
    this.isDeposit,
    this.tlyncUrl,
    this.lastReconnectAt,
    this.lastReconnectStatus,
    this.financialTypeAr,
    this.financialTypeEn,
    this.photo,
    this.sender,
    this.city,
    this.subCity,
    this.productsPackage,
    this.isFiftyOkay,
    this.internationalPackageCode,
    this.currencyType,
    this.totalAmount,
    this.createdAt,
    this.updatedAt,
    this.packageInstractions,
    this.hashid,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        packageCode: json['package-code'] as String?,
        packageType: json['package_type'] == null
            ? null
            : PackageType.fromJson(
                json['package_type'] as Map<String, dynamic>),
        packageSubType: json['package_sub_type'] as dynamic,
        reciever: json['reciever'] as String?,
        phone: json['phone'] as String?,
        phoneB: json['phone_b'] as dynamic,
        address: json['address'] as String?,
        price: json['price'] as int?,
        originPrice: json['origin_price'] as int?,
        shippment: json['shippment'] as int?,
        total: json['total'] as int?,
        extraSizePrice: json['extra_size_price'] as int?,
        regionCommission: json['region_commission'] as int?,
        paymentMethode: json['payment_methode'] as String?,
        paidBy: json['paid_by'] as String?,
        extraSizeBy: json['extra_size_by'] as String?,
        commissionBy: json['commission_by'] as String?,
        courierCommunication: json['courier_communication'] as int?,
        paidByAr: json['paid_by_ar'] as String?,
        extraSizeByAr: json['extra_size_by_ar'] as String?,
        commissionByAr: json['commission_by_ar'] as String?,
        status: json['status'] as String?,
        statusObject: json['status_object'] == null
            ? null
            : StatusObject.fromJson(
                json['status_object'] as Map<String, dynamic>),
        createDate: json['create_date'] as String?,
        addressCode: json['address_code'] as dynamic,
        instoreDate: json['instore_date'] as String?,
        deliveryDate: json['delivery_date'] as String?,
        updateDate: json['update_date'] as String?,
        qty: json['qty'] as int?,
        qtyReturn: json['qty_return'] as int?,
        recievedMoney: json['recieved_money'] as int?,
        description: json['description'] as String?,
        nonDeliveryReason: json['non_delivery_reason'] as int?,
        nonDeliveryText: json['non_delivery_text'] as String?,
        stockLocation: json['stock_location'] == null
            ? null
            : StockLocation.fromJson(
                json['stock_location'] as Map<String, dynamic>),
        pkgOrign: json['pkg_orign'] as int?,
        stickerNotes: json['sticker_notes'] as dynamic,
        leangh: json['leangh'] as int?,
        width: json['width'] as int?,
        height: json['height'] as int?,
        storeReferenceId: json['store_reference_id'] as String?,
        map: json['map'] as dynamic,
        origin: json['origin'] == null
            ? null
            : Origin.fromJson(json['origin'] as Map<String, dynamic>),
        breakable: json['breakable'] as int?,
        receiptMoney: json['receipt_money'] as int?,
        measuringIsAllowed: json['measuring_is_allowed'] as int?,
        partialDelivery: json['partial_delivery'] as int?,
        storageSubscription: json['storage_subscription'] as int?,
        inspectionAllowed: json['inspection_allowed'] as int?,
        heatIntolerance: json['heat_intolerance'] as int?,
        storeSubSender: json['store_sub_sender'] as int?,
        casing: json['casing'] as int?,
        isDeposit: json['is_deposit'] as dynamic,
        tlyncUrl: json['tlync_url'] as dynamic,
        lastReconnectAt: json['last_reconnect_at'] as dynamic,
        lastReconnectStatus: json['last_reconnect_status'] as dynamic,
        financialTypeAr: json['financial_type_ar'] as dynamic,
        financialTypeEn: json['financial_type_en'] as dynamic,
        photo: json['photo'] as dynamic,
        sender: json['sender'] == null
            ? null
            : Sender.fromJson(json['sender'] as Map<String, dynamic>),
        city: json['City'] == null
            ? null
            : City.fromJson(json['City'] as Map<String, dynamic>),
        subCity: json['sub_city'] as dynamic,
        productsPackage: json['products_package'] as List<dynamic>?,
        isFiftyOkay: json['isFiftyOkay'] as int?,
        internationalPackageCode: json['international_package_code'] as dynamic,
        currencyType: json['currency_type'] as dynamic,
        totalAmount: json['total_amount'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        packageInstractions: json['package_instractions'] == null
            ? null
            : PackageInstractions.fromJson(
                json['package_instractions'] as Map<String, dynamic>),
        hashid: json['hashid'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'package-code': packageCode,
        'package_type': packageType?.toJson(),
        'package_sub_type': packageSubType,
        'reciever': reciever,
        'phone': phone,
        'phone_b': phoneB,
        'address': address,
        'price': price,
        'origin_price': originPrice,
        'shippment': shippment,
        'total': total,
        'extra_size_price': extraSizePrice,
        'region_commission': regionCommission,
        'payment_methode': paymentMethode,
        'paid_by': paidBy,
        'extra_size_by': extraSizeBy,
        'commission_by': commissionBy,
        'courier_communication': courierCommunication,
        'paid_by_ar': paidByAr,
        'extra_size_by_ar': extraSizeByAr,
        'commission_by_ar': commissionByAr,
        'status': status,
        'status_object': statusObject?.toJson(),
        'create_date': createDate,
        'address_code': addressCode,
        'instore_date': instoreDate,
        'delivery_date': deliveryDate,
        'update_date': updateDate,
        'qty': qty,
        'qty_return': qtyReturn,
        'recieved_money': recievedMoney,
        'description': description,
        'non_delivery_reason': nonDeliveryReason,
        'non_delivery_text': nonDeliveryText,
        'stock_location': stockLocation?.toJson(),
        'pkg_orign': pkgOrign,
        'sticker_notes': stickerNotes,
        'leangh': leangh,
        'width': width,
        'height': height,
        'store_reference_id': storeReferenceId,
        'map': map,
        'origin': origin?.toJson(),
        'breakable': breakable,
        'receipt_money': receiptMoney,
        'measuring_is_allowed': measuringIsAllowed,
        'partial_delivery': partialDelivery,
        'storage_subscription': storageSubscription,
        'inspection_allowed': inspectionAllowed,
        'heat_intolerance': heatIntolerance,
        'store_sub_sender': storeSubSender,
        'casing': casing,
        'is_deposit': isDeposit,
        'tlync_url': tlyncUrl,
        'last_reconnect_at': lastReconnectAt,
        'last_reconnect_status': lastReconnectStatus,
        'financial_type_ar': financialTypeAr,
        'financial_type_en': financialTypeEn,
        'photo': photo,
        'sender': sender?.toJson(),
        'City': city?.toJson(),
        'sub_city': subCity,
        'products_package': productsPackage,
        'isFiftyOkay': isFiftyOkay,
        'international_package_code': internationalPackageCode,
        'currency_type': currencyType,
        'total_amount': totalAmount,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'package_instractions': packageInstractions?.toJson(),
        'hashid': hashid,
      };
}
