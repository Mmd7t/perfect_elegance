class PolicyDatum {
  int? id;
  String? title;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;

  PolicyDatum({
    this.id,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory PolicyDatum.fromJson(Map<String, dynamic> json) => PolicyDatum(
        id: json['id'] as int?,
        title: json['title'] as String?,
        content: json['content'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
