import 'dart:convert';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationsHelper {
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
    enableLights: true,
    ledColor: Constants.primary,
    showBadge: true,
  );

  static init() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/launcher_icon');
    var initializationsSettings =
        InitializationSettings(android: androidInitialize);
    await flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onDidReceiveNotificationResponse: (payload) async {
        log('On Message Clicked ====> ${jsonDecode(payload.payload!)}');
        return;
      },
    );
  }

  static show(RemoteMessage message) async {
    log('Notification Payload ==> ${message.toMap()}');
    log('Current Route ==> ${Get.currentRoute}');
    await flutterLocalNotificationsPlugin.show(
      1,
      message.notification!.title,
      message.notification!.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          importance: Importance.max,
          priority: Priority.max,
          enableLights: true,
          ledColor: Constants.primary,
          audioAttributesUsage: AudioAttributesUsage.notification,
          ledOnMs: 2,
          ledOffMs: 2,
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }

  static handleNotificationCallback(RemoteMessage message) {}
}

@pragma('vm:entry-point')
Future<void> notificationsBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  log('Notification Payload ==> ${message.toMap()}');
}
