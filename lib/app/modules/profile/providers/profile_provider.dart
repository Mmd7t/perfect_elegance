import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/providers/api_provider.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';

class ProfileProvider extends ApiProvider {
  // NOTE :- GET Account Statements
  Future<Map<String, dynamic>?> getAccountStatements({int page = 1}) async {
    Response<Map<String, dynamic>?> res = await get<Map<String, dynamic>?>(
        'account-statement?page=$page',
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

  // NOTE :- GET Account Statements
  Future<Map<String, dynamic>?> getPolicy() async {
    Response<Map<String, dynamic>?> res =
        await get<Map<String, dynamic>?>('policy', headers: {
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

  // NOTE :- GET Account Statements
  Future<Map<String, dynamic>?> getTerms() async {
    Response<Map<String, dynamic>?> res =
        await get<Map<String, dynamic>?>('terms-conditions', headers: {
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
