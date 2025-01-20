import 'settlement.dart';

class SettlementsModel {
  List<Settlement> settlements;

  SettlementsModel({this.settlements = const []});

  factory SettlementsModel.fromJson(Map<String, dynamic> json) {
    return SettlementsModel(
      settlements: (json['settlements'] as List<dynamic>)
          .map((e) => Settlement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
