class CustomerModel {
  int? id;
  String? name;
  dynamic email;
  String? phone;
  String? address;
  String? ordersCount;
  int? active;

  CustomerModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.ordersCount,
    this.active,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as dynamic,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      ordersCount: json['order_count'].toString(),
      active: json['active'] as int?,
    );
  }
}
