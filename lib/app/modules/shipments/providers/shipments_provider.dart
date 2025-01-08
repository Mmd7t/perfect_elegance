import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/providers/api_provider.dart';

class ShipmentsProvider extends ApiProvider {
  // NOTE :- GET Pending Packages
  Future<Map<String, dynamic>?> getPendingPackages() async {
    Response<Map<String, dynamic>?> res = await get<Map<String, dynamic>?>(
        'packages/pending',
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

  // NOTE :- GET Packages
  Future<Map<String, dynamic>?> getPackages() async {
    Response<Map<String, dynamic>?> res = await get<Map<String, dynamic>?>(
        'packages',
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
