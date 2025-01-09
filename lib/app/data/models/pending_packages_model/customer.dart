class Customer {
  int? id;
  String? name;
  dynamic email;
  String? phone;
  String? address;

  Customer({this.id, this.name, this.email, this.phone, this.address});

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as dynamic,
        phone: json['phone'] as String?,
        address: json['address'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
      };
}
