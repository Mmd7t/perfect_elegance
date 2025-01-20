class Sender {
  int? id;
  String? name;

  Sender({this.id, this.name});

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
