class StatusObject {
  int? id;
  String? statusValue;
  String? statusNameAdmin;
  String? statusNameCust;
  String? type;
  String? statusLog;
  String? notes;

  StatusObject({
    this.id,
    this.statusValue,
    this.statusNameAdmin,
    this.statusNameCust,
    this.type,
    this.statusLog,
    this.notes,
  });

  factory StatusObject.fromJson(Map<String, dynamic> json) => StatusObject(
        id: json['id'] as int?,
        statusValue: json['status_value'] as String?,
        statusNameAdmin: json['status_name_admin'] as String?,
        statusNameCust: json['status_name_cust'] as String?,
        type: json['type'] as String?,
        statusLog: json['status_log'] as String?,
        notes: json['notes'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status_value': statusValue,
        'status_name_admin': statusNameAdmin,
        'status_name_cust': statusNameCust,
        'type': type,
        'status_log': statusLog,
        'notes': notes,
      };
}
