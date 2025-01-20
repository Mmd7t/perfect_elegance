import 'status.dart';
import 'ticket.dart';

class TicketDetailsModel {
  Ticket? ticket;
  List<Status>? status;

  TicketDetailsModel({this.ticket, this.status});

  factory TicketDetailsModel.fromJson(Map<String, dynamic> json) {
    return TicketDetailsModel(
      ticket: json['ticket'] == null
          ? null
          : Ticket.fromJson(json['ticket'] as Map<String, dynamic>),
      status: (json['status'] as List<dynamic>?)
          ?.map((e) => Status.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'ticket': ticket?.toJson(),
        'status': status?.map((e) => e.toJson()).toList(),
      };
}
