import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/notifications/providers/notifications_provider.dart';

import '../controllers/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsProvider>(() => NotificationsProvider());
    Get.lazyPut<NotificationsController>(() => NotificationsController());
  }
}
