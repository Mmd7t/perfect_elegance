import 'ticket.dart';

class AllTicketsModel {
  List<Ticket>? tickets;

  AllTicketsModel({this.tickets});

  factory AllTicketsModel.fromJson(Map<String, dynamic> json) {
    return AllTicketsModel(
      tickets: (json['tickets'] as List<dynamic>?)
          ?.map((e) => Ticket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'tickets': tickets?.map((e) => e.toJson()).toList(),
      };
}
