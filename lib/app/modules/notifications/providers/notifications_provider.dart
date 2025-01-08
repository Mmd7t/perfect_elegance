import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/providers/api_provider.dart';

class NotificationsProvider extends ApiProvider {
  // NOTE :- Post Send Notifications
  Future<Map<String, dynamic>?> postSendNotifications(
      {required String userId,
      required String title,
      required String body}) async {
    Response<Map<String, dynamic>?> res = await post<Map<String, dynamic>?>(
        'send-fcm-notification',
        {'user_id': userId, 'title': title, 'body': body},
        headers: {'Accept': 'application/json'});
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return {
        'code': res.statusCode!,
        'data': res.body as Map<String, dynamic>,
      };
    }
  }

  // NOTE :- Put Update User Fcm
  Future<Map<String, dynamic>?> putUpdateUserFcm(
      {required String userId, required String fcmToken}) async {
    Response<Map<String, dynamic>?> res = await put<Map<String, dynamic>?>(
        'update-device-token', {'user_id': userId, 'fcm_token': fcmToken},
        headers: {'Accept': 'application/json'});
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return {
        'code': res.statusCode!,
        'data': res.body as Map<String, dynamic>,
      };
    }
  }
}
