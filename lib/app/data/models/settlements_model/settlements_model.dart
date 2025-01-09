import 'settlement.dart';

class SettlementsModel {
  List<Settlement>? settlements;

  SettlementsModel({this.settlements});

  factory SettlementsModel.fromJson(Map<String, dynamic> json) {
    return SettlementsModel(
      settlements: (json['settlements'] as List<dynamic>?)
          ?.map((e) => Settlement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'settlements': settlements?.map((e) => e.toJson()).toList(),
      };
}
