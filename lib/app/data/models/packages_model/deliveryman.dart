class Deliveryman {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;

  Deliveryman({this.id, this.name, this.email, this.phone, this.address});

  factory Deliveryman.fromJson(Map<String, dynamic> json) => Deliveryman(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
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
