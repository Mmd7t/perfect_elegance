import 'ticket.dart';

class AllTicketsModel {
  List<Ticket> tickets;

  AllTicketsModel({this.tickets = const []});

  factory AllTicketsModel.fromJson(Map<String, dynamic> json) {
    return AllTicketsModel(
      tickets: (json['tickets'] as List<dynamic>)
          .map((e) => Ticket.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
