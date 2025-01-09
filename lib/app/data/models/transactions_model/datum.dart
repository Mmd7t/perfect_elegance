class Datum {
  int? id;
  String? documentNumber;
  int? userId;
  int? storeId;
  dynamic treasuryId;
  int? currencyId;
  dynamic transactionCategoryId;
  String? type;
  double? amount;
  double? balance;
  String? notes;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.documentNumber,
    this.userId,
    this.storeId,
    this.treasuryId,
    this.currencyId,
    this.transactionCategoryId,
    this.type,
    this.amount,
    this.balance,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        documentNumber: json['document_number'] as String?,
        userId: json['user_id'] as int?,
        storeId: json['store_id'] as int?,
        treasuryId: json['treasury_id'] as dynamic,
        currencyId: json['currency_id'] as int?,
        transactionCategoryId: json['transaction_category_id'] as dynamic,
        type: json['type'] as String?,
        amount: (json['amount'] as num?)?.toDouble(),
        balance: (json['balance'] as num?)?.toDouble(),
        notes: json['notes'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'document_number': documentNumber,
        'user_id': userId,
        'store_id': storeId,
        'treasury_id': treasuryId,
        'currency_id': currencyId,
        'transaction_category_id': transactionCategoryId,
        'type': type,
        'amount': amount,
        'balance': balance,
        'notes': notes,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
