import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:perfect_elegance/app/core/helpers/notification_helper.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/firebase_options.dart';

Future<void> initServices() async {
  Get.log('starting services ...');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Get.putAsync<AppServices>(() async => AppServices());
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  await NotificationsHelper.init();
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    log('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    log('User granted provisional permission');
  } else {
    log('User declined or has not accepted permission');
  }
  Get.log('All services started...');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  FirebaseMessaging.onMessage.listen(
    (event) {
      if (Get.find<AppServices>().notificationsOn.value) {
        NotificationsHelper.show(event);
      }
    },
  );
  FirebaseMessaging.onBackgroundMessage(notificationsBackgroundHandler);
  FirebaseMessaging.onMessageOpenedApp
      .listen(NotificationsHelper.handleNotificationCallback);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PE Seller',
      theme: light,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: const Locale('ar', 'EG'),
      supportedLocales: const [
        Locale('ar', 'EG'),
      ],
      textDirection: TextDirection.rtl,
      initialRoute: AppPages.initial,
      defaultTransition: Transition.rightToLeft,
      getPages: AppPages.routes,
    );
  }
}
