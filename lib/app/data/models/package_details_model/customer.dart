class Customer {
  int? id;
  String? name;
  dynamic email;
  String? phone;
  String? address;
  int? orderCount;

  Customer({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.orderCount,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as dynamic,
        phone: json['phone'] as String?,
        address: json['address'] as String?,
        orderCount: json['order_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'order_count': orderCount,
      };
}
