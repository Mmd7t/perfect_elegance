import 'polices.dart';

class PolicyModel {
  Polices? polices;

  PolicyModel({this.polices});

  factory PolicyModel.fromJson(Map<String, dynamic> json) => PolicyModel(
        polices: json['polices'] == null
            ? null
            : Polices.fromJson(json['polices'] as Map<String, dynamic>),
      );
}
