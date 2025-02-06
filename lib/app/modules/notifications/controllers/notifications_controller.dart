import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/models/notifications_model/notification.dart';
import 'package:perfect_elegance/app/modules/notifications/providers/notifications_provider.dart';

class NotificationsController extends GetxController {
  final NotificationsProvider provider = Get.find<NotificationsProvider>();

  RxBool isLoading = false.obs;
  RxList<Notification> notifications = <Notification>[].obs;
  getNotifications() async {
    isLoading.value = true;
    final Map<String, dynamic>? res = await provider.getNotifications();
    isLoading.value = false;
    if (res != null) {
      if (res['code'] == 200) {
        notifications.value = (res['data']['notifications'] as List)
            .map((e) => Notification.fromJson(e))
            .toList();
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
    getNotifications();
  }
}
