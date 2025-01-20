class PackageInstractions {
  String? empty;

  PackageInstractions({this.empty});

  factory PackageInstractions.fromJson(Map<String, dynamic> json) {
    return PackageInstractions(
      empty: json['empty'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'empty': empty,
      };
}
