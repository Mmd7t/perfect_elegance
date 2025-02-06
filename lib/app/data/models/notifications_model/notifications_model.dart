import 'notification.dart';

class NotificationsModel {
  List<Notification>? notifications;
  String? message;

  NotificationsModel({this.notifications, this.message});

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'notifications': notifications?.map((e) => e.toJson()).toList(),
        'message': message,
      };
}
