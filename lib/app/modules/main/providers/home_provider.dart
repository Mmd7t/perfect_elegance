import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/providers/api_provider.dart';

import '../../../data/services/app_services.dart';

class HomeProvider extends ApiProvider {
  // NOTE :- GET Index
  Future<Map<String, dynamic>?> getHomeData() async {
    Response<Map<String, dynamic>?> res =
        await get<Map<String, dynamic>?>('index', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
    });
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
