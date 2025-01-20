class Product {
  int? id;
  int? userId;
  int? storeId;
  dynamic brandId;
  dynamic genederId;
  dynamic categoryId;
  int? dollarPurchasingPrice;
  int? dinarSellingPrice;
  dynamic sellFactor;
  String? name;
  dynamic image;
  dynamic barcode;
  dynamic weight;
  dynamic assignWeightAt;
  String? purchasesLink;
  String? sku;
  dynamic notes;
  int? type;
  String? createDate;
  dynamic deletedAt;
  int? deleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic liraPurchasingPrice;
  String? fullImage;
  List<dynamic>? sizesList;
  List<dynamic>? promptDeliveryProductIds;

  Product({
    this.id,
    this.userId,
    this.storeId,
    this.brandId,
    this.genederId,
    this.categoryId,
    this.dollarPurchasingPrice,
    this.dinarSellingPrice,
    this.sellFactor,
    this.name,
    this.image,
    this.barcode,
    this.weight,
    this.assignWeightAt,
    this.purchasesLink,
    this.sku,
    this.notes,
    this.type,
    this.createDate,
    this.deletedAt,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.liraPurchasingPrice,
    this.fullImage,
    this.sizesList,
    this.promptDeliveryProductIds,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        storeId: json['store_id'] as int?,
        brandId: json['brand_id'] as dynamic,
        genederId: json['geneder_id'] as dynamic,
        categoryId: json['category_id'] as dynamic,
        dollarPurchasingPrice: json['dollar_purchasing_price'] as int?,
        dinarSellingPrice: json['dinar_selling_price'] as int?,
        sellFactor: json['sell_factor'] as dynamic,
        name: json['name'] as String?,
        image: json['image'] as dynamic,
        barcode: json['barcode'] as dynamic,
        weight: json['weight'] as dynamic,
        assignWeightAt: json['assign_weight_at'] as dynamic,
        purchasesLink: json['purchases_link'] as String?,
        sku: json['sku'] as String?,
        notes: json['notes'] as dynamic,
        type: json['type'] as int?,
        createDate: json['create_date'] as String?,
        deletedAt: json['deleted_at'] as dynamic,
        deleted: json['deleted'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        liraPurchasingPrice: json['lira_purchasing_price'] as dynamic,
        fullImage: json['full_image'] as String?,
        sizesList: json['SizesList'] as List<dynamic>?,
        promptDeliveryProductIds:
            json['prompt_delivery_product_ids'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'store_id': storeId,
        'brand_id': brandId,
        'geneder_id': genederId,
        'category_id': categoryId,
        'dollar_purchasing_price': dollarPurchasingPrice,
        'dinar_selling_price': dinarSellingPrice,
        'sell_factor': sellFactor,
        'name': name,
        'image': image,
        'barcode': barcode,
        'weight': weight,
        'assign_weight_at': assignWeightAt,
        'purchases_link': purchasesLink,
        'sku': sku,
        'notes': notes,
        'type': type,
        'create_date': createDate,
        'deleted_at': deletedAt,
        'deleted': deleted,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'lira_purchasing_price': liraPurchasingPrice,
        'full_image': fullImage,
        'SizesList': sizesList,
        'prompt_delivery_product_ids': promptDeliveryProductIds,
      };
}
