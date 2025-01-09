class Currency {
  int? id;
  String? title;

  Currency({this.id, this.title});

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json['id'] as int?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
      };
}
