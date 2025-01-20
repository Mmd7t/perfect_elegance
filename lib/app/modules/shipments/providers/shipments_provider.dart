import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/providers/api_provider.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';

class ShipmentsProvider extends ApiProvider {
  // NOTE :- GET Packages
  Future<Map<String, dynamic>?> getPackages({
    int page = 1,
    String id = "",
    String status = "",
  }) async {
    Response<Map<String, dynamic>?> res = await get<Map<String, dynamic>?>(
        'packages?page=$page&q=$id&status=$status',
        headers: {
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${Get.find<AppServices>().accessToken.value}',
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

  // NOTE :- GET Packages
  Future<Map<String, dynamic>?> getPackageDetails(int id) async {
    Response<Map<String, dynamic>?> res =
        await get<Map<String, dynamic>?>('packages/$id/show', headers: {
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
