class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  dynamic orderCount;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.orderCount,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        address: json['address'] as String?,
        orderCount: json['order_count'] as dynamic,
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
