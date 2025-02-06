class Product {
  int? userId;
  int? storeId;
  String? name;
  String? sku;
  dynamic genederId;
  dynamic categoryId;
  dynamic notes;
  String? purchasesLink;
  int? dollarPurchasingPrice;
  int? dinarSellingPrice;
  dynamic sellFactor;
  int? type;
  DateTime? createDate;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  String? fullImage;
  List<dynamic>? sizesList;
  List<dynamic>? promptDeliveryProductIds;

  Product({
    this.userId,
    this.storeId,
    this.name,
    this.sku,
    this.genederId,
    this.categoryId,
    this.notes,
    this.purchasesLink,
    this.dollarPurchasingPrice,
    this.dinarSellingPrice,
    this.sellFactor,
    this.type,
    this.createDate,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.fullImage,
    this.sizesList,
    this.promptDeliveryProductIds,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        userId: json['user_id'] as int?,
        storeId: json['store_id'] as int?,
        name: json['name'] as String?,
        sku: json['sku'] as String?,
        genederId: json['geneder_id'] as dynamic,
        categoryId: json['category_id'] as dynamic,
        notes: json['notes'] as dynamic,
        purchasesLink: json['purchases_link'] as String?,
        dollarPurchasingPrice: json['dollar_purchasing_price'] as int?,
        dinarSellingPrice: json['dinar_selling_price'] as int?,
        sellFactor: json['sell_factor'] as dynamic,
        type: json['type'] as int?,
        createDate: json['create_date'] == null
            ? null
            : DateTime.parse(json['create_date'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        id: json['id'] as int?,
        fullImage: json['full_image'] as String?,
        sizesList: json['SizesList'] as List<dynamic>?,
        promptDeliveryProductIds:
            json['prompt_delivery_product_ids'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'store_id': storeId,
        'name': name,
        'sku': sku,
        'geneder_id': genederId,
        'category_id': categoryId,
        'notes': notes,
        'purchases_link': purchasesLink,
        'dollar_purchasing_price': dollarPurchasingPrice,
        'dinar_selling_price': dinarSellingPrice,
        'sell_factor': sellFactor,
        'type': type,
        'create_date': createDate?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
        'full_image': fullImage,
        'SizesList': sizesList,
        'prompt_delivery_product_ids': promptDeliveryProductIds,
      };
}
