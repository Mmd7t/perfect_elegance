class SearchCustomerModel {
  int? id;
  int? userId;
  String? name;
  String? phone;
  dynamic phone2;
  String? cityName;
  int? cityId;
  dynamic subCityId;
  dynamic subCityName;
  String? address;
  dynamic email;

  SearchCustomerModel({
    this.id,
    this.userId,
    this.name,
    this.phone,
    this.phone2,
    this.cityName,
    this.cityId,
    this.subCityId,
    this.subCityName,
    this.address,
    this.email,
  });

  factory SearchCustomerModel.fromJson(Map<String, dynamic> json) {
    return SearchCustomerModel(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      phone2: json['phone2'] as dynamic,
      cityName: json['city_name'] as String?,
      cityId: json['city_id'] as int?,
      subCityId: json['sub_city_id'] as dynamic,
      subCityName: json['sub_city_name'] as dynamic,
      address: json['address'] as String?,
      email: json['email'] as dynamic,
    );
  }
}
