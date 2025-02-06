import 'customer.dart';
import 'product_order.dart';
import 'vanex_package.dart';

class PackageDetailsModel {
  int? id;
  String? vanexPackageCode;
  String? vanexDelegateType;
  String? deliverymanConfirmAt;
  int? vanexPackageId;
  String? packageType;
  String? desc;
  String? phone;
  int? orderId;
  String? status;
  String? shippingOn;
  Customer? customer;
  List<ProductOrder> productOrders;
  VanexPackage? vanexPackage;

  PackageDetailsModel({
    this.id,
    this.vanexPackageCode,
    this.vanexDelegateType,
    this.deliverymanConfirmAt,
    this.vanexPackageId,
    this.packageType,
    this.desc,
    this.phone,
    this.orderId,
    this.status,
    this.shippingOn,
    this.customer,
    this.productOrders = const [],
    this.vanexPackage,
  });

  factory PackageDetailsModel.fromJson(Map<String, dynamic> json) {
    return PackageDetailsModel(
      id: json['id'] as int?,
      vanexPackageCode: json['vanex_package_code'] as String?,
      vanexDelegateType: json['vanex_delegate_type'] as String?,
      deliverymanConfirmAt: json['deliveryman_confirm_at'] as String?,
      vanexPackageId: json['vanex_package_id'] as int?,
      packageType: json['package_type'] as String?,
      desc: json['desc'] as String?,
      phone: json['phone'] as String?,
      orderId: json['order_id'] as int?,
      status: json['status'] as String?,
      shippingOn: json['shipping_on'] as String?,
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      productOrders: (json['product_orders'] as List<dynamic>)
          .map((e) => ProductOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      vanexPackage: json['vanex_package'] == null
          ? null
          : VanexPackage.fromJson(
              json['vanex_package'] as Map<String, dynamic>),
    );
  }
}
