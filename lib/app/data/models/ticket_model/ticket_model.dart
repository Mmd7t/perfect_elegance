import 'status.dart';
import 'ticket.dart';

class TicketModel {
  Ticket? ticket;
  List<Status>? status;

  TicketModel({this.ticket, this.status});

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        ticket: json['ticket'] == null
            ? null
            : Ticket.fromJson(json['ticket'] as Map<String, dynamic>),
        status: (json['status'] as List<dynamic>?)
            ?.map((e) => Status.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'ticket': ticket?.toJson(),
        'status': status?.map((e) => e.toJson()).toList(),
      };
}
