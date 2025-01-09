import 'status.dart';
import 'store.dart';

class Ticket {
  int? id;
  String? title;
  String? userType;
  int? userId;
  int? storeId;
  int? statusId;
  String? management;
  String? toManagement;
  String? priority;
  String? description;
  dynamic closedableId;
  dynamic closedableType;
  dynamic closedAt;
  dynamic closureNote;
  String? packageCode;
  int? transfaredToVanex;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? vanexTicketId;
  String? ticketPriority;
  Status? status;
  Store? store;

  Ticket({
    this.id,
    this.title,
    this.userType,
    this.userId,
    this.storeId,
    this.statusId,
    this.management,
    this.toManagement,
    this.priority,
    this.description,
    this.closedableId,
    this.closedableType,
    this.closedAt,
    this.closureNote,
    this.packageCode,
    this.transfaredToVanex,
    this.createdAt,
    this.updatedAt,
    this.vanexTicketId,
    this.ticketPriority,
    this.status,
    this.store,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json['id'] as int?,
        title: json['title'] as String?,
        userType: json['user_type'] as String?,
        userId: json['user_id'] as int?,
        storeId: json['store_id'] as int?,
        statusId: json['status_id'] as int?,
        management: json['management'] as String?,
        toManagement: json['to_management'] as String?,
        priority: json['priority'] as String?,
        description: json['description'] as String?,
        closedableId: json['closedable_id'] as dynamic,
        closedableType: json['closedable_type'] as dynamic,
        closedAt: json['closed_at'] as dynamic,
        closureNote: json['closure_note'] as dynamic,
        packageCode: json['package_code'] as String?,
        transfaredToVanex: json['transfared_to_vanex'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        vanexTicketId: json['vanex_ticket_id'] as int?,
        ticketPriority: json['ticket_priority'] as String?,
        status: json['status'] == null
            ? null
            : Status.fromJson(json['status'] as Map<String, dynamic>),
        store: json['store'] == null
            ? null
            : Store.fromJson(json['store'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'user_type': userType,
        'user_id': userId,
        'store_id': storeId,
        'status_id': statusId,
        'management': management,
        'to_management': toManagement,
        'priority': priority,
        'description': description,
        'closedable_id': closedableId,
        'closedable_type': closedableType,
        'closed_at': closedAt,
        'closure_note': closureNote,
        'package_code': packageCode,
        'transfared_to_vanex': transfaredToVanex,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'vanex_ticket_id': vanexTicketId,
        'ticket_priority': ticketPriority,
        'status': status?.toJson(),
        'store': store?.toJson(),
      };
}
