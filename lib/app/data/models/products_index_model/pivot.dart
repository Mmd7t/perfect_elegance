class Pivot {
  int? storeId;
  int? categoryId;

  Pivot({this.storeId, this.categoryId});

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        storeId: json['store_id'] as int?,
        categoryId: json['category_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'store_id': storeId,
        'category_id': categoryId,
      };
}
