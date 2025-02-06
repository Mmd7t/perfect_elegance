class Data {
  String? title;
  String? body;

  Data({this.title, this.body});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json['title'] as String?,
        body: json['body'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
      };
}
