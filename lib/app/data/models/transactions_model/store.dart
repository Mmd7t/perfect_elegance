class Store {
  int? id;
  String? name;
  String? email;
  dynamic logo;
  String? slug;
  int? enable;
  int? special;
  int? sortingService;
  int? isVerified;
  int? purchasesPercentage;
  String? phone;
  String? whatsapp;
  String? storelink;
  double? balanceLyd;
  int? balanceTry;
  int? balanceUsd;
  dynamic balanceLimit;
  dynamic sellFactor;
  int? shipping;
  int? buying;
  int? financialSettlement;
  int? userManagerId;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic shippingMethodId;
  String? vanexApiKey;
  int? storeTypeId;
  int? storeLevelId;
  String? passportNumber;
  String? idNumber;
  int? discountRate;
  dynamic whatsapp2;
  dynamic whatsapp3;
  int? totalOrders;
  int? totalProductOrders;

  Store({
    this.id,
    this.name,
    this.email,
    this.logo,
    this.slug,
    this.enable,
    this.special,
    this.sortingService,
    this.isVerified,
    this.purchasesPercentage,
    this.phone,
    this.whatsapp,
    this.storelink,
    this.balanceLyd,
    this.balanceTry,
    this.balanceUsd,
    this.balanceLimit,
    this.sellFactor,
    this.shipping,
    this.buying,
    this.financialSettlement,
    this.userManagerId,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.shippingMethodId,
    this.vanexApiKey,
    this.storeTypeId,
    this.storeLevelId,
    this.passportNumber,
    this.idNumber,
    this.discountRate,
    this.whatsapp2,
    this.whatsapp3,
    this.totalOrders,
    this.totalProductOrders,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        logo: json['logo'] as dynamic,
        slug: json['slug'] as String?,
        enable: json['enable'] as int?,
        special: json['special'] as int?,
        sortingService: json['sorting_service'] as int?,
        isVerified: json['is_verified'] as int?,
        purchasesPercentage: json['purchases_percentage'] as int?,
        phone: json['phone'] as String?,
        whatsapp: json['whatsapp'] as String?,
        storelink: json['storelink'] as String?,
        balanceLyd: (json['balance_lyd'] as num?)?.toDouble(),
        balanceTry: json['balance_try'] as int?,
        balanceUsd: json['balance_usd'] as int?,
        balanceLimit: json['balance_limit'] as dynamic,
        sellFactor: json['sell_factor'] as dynamic,
        shipping: json['shipping'] as int?,
        buying: json['buying'] as int?,
        financialSettlement: json['financial_settlement'] as int?,
        userManagerId: json['user_manager_id'] as int?,
        address: json['address'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        shippingMethodId: json['shipping_method_id'] as dynamic,
        vanexApiKey: json['vanex_api_key'] as String?,
        storeTypeId: json['store_type_id'] as int?,
        storeLevelId: json['store_level_id'] as int?,
        passportNumber: json['passport_number'] as String?,
        idNumber: json['id_number'] as String?,
        discountRate: json['discount_rate'] as int?,
        whatsapp2: json['whatsapp_2'] as dynamic,
        whatsapp3: json['whatsapp_3'] as dynamic,
        totalOrders: json['total_orders'] as int?,
        totalProductOrders: json['total_product_orders'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'logo': logo,
        'slug': slug,
        'enable': enable,
        'special': special,
        'sorting_service': sortingService,
        'is_verified': isVerified,
        'purchases_percentage': purchasesPercentage,
        'phone': phone,
        'whatsapp': whatsapp,
        'storelink': storelink,
        'balance_lyd': balanceLyd,
        'balance_try': balanceTry,
        'balance_usd': balanceUsd,
        'balance_limit': balanceLimit,
        'sell_factor': sellFactor,
        'shipping': shipping,
        'buying': buying,
        'financial_settlement': financialSettlement,
        'user_manager_id': userManagerId,
        'address': address,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'shipping_method_id': shippingMethodId,
        'vanex_api_key': vanexApiKey,
        'store_type_id': storeTypeId,
        'store_level_id': storeLevelId,
        'passport_number': passportNumber,
        'id_number': idNumber,
        'discount_rate': discountRate,
        'whatsapp_2': whatsapp2,
        'whatsapp_3': whatsapp3,
        'total_orders': totalOrders,
        'total_product_orders': totalProductOrders,
      };
}
