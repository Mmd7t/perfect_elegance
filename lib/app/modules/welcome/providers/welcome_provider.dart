import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/providers/api_provider.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';

class WelcomeProvider extends ApiProvider {
  // NOTE :- Post Login
  Future<Map<String, dynamic>?> getUser() async {
    Response<Map<String, dynamic>?> res = await get<Map<String, dynamic>?>(
      'user',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
      },
    );
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      return {
        'code': res.statusCode,
        'data': res.body,
      };
    }
  }
}
