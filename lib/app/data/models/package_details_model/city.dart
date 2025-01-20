class City {
  int? id;
  String? name;
  dynamic code;
  dynamic nameEn;
  dynamic region;
  int? price;
  dynamic estTime;

  City({
    this.id,
    this.name,
    this.code,
    this.nameEn,
    this.region,
    this.price,
    this.estTime,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'] as int?,
        name: json['name'] as String?,
        code: json['code'] as dynamic,
        nameEn: json['name_en'] as dynamic,
        region: json['region'] as dynamic,
        price: json['price'] as int?,
        estTime: json['est_time'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'name_en': nameEn,
        'region': region,
        'price': price,
        'est_time': estTime,
      };
}
