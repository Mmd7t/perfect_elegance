class Reply {
  int? id;
  String? userType;
  int? userId;
  int? ticketId;
  int? storeId;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  Reply({
    this.id,
    this.userType,
    this.userId,
    this.ticketId,
    this.storeId,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        id: json['id'] as int?,
        userType: json['user_type'] as String?,
        userId: json['user_id'] as int?,
        ticketId: json['ticket_id'] as int?,
        storeId: json['store_id'] as int?,
        description: json['description'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_type': userType,
        'user_id': userId,
        'ticket_id': ticketId,
        'store_id': storeId,
        'description': description,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
