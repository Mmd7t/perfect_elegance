import 'polices.dart';

class PoliciesModel {
  Polices? polices;

  PoliciesModel({this.polices});

  factory PoliciesModel.fromJson(Map<String, dynamic> json) => PoliciesModel(
        polices: json['polices'] == null
            ? null
            : Polices.fromJson(json['polices'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'polices': polices?.toJson(),
      };
}
