import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/providers/api_provider.dart';

class SettlementsProvider extends ApiProvider {
  // NOTE :- GET Settlements
  Future<Map<String, dynamic>?> getSettlements() async {
    Response<Map<String, dynamic>?> res = await get<Map<String, dynamic>?>(
        'store-settlements',
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
