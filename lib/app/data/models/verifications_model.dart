class VerificationsModel {
  List<dynamic>? verifications;

  VerificationsModel({this.verifications});

  factory VerificationsModel.fromJson(Map<String, dynamic> json) {
    return VerificationsModel(
      verifications: json['verifications'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'verifications': verifications,
      };
}
