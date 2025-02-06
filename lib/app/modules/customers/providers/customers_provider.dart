import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/providers/api_provider.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';

class CustomerProvider extends ApiProvider {
  // NOTE :- GET Customers
  Future<Map<String, dynamic>?> getCustomers({String q = ""}) async {
    Response res = await get('customers?q=$q', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
    });
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return {
        'code': res.statusCode!,
        'data': res.statusCode == 200 ? res.body as List<dynamic> : res.body,
      };
    }
  }

  // NOTE :- GET Customer data
  Future<Map<String, dynamic>?> getCustomerDetails(int id) async {
    Response res = await get('customers/$id/show', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
    });
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return {
        'code': res.statusCode!,
        'data': res.body as Map<String, dynamic>?,
      };
    }
  }

  // NOTE :- GET Customer data
  Future<int?> postBanCustomer(int id) async {
    Response res = await post('customers/$id/ban', {}, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
    });
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return res.statusCode!;
    }
  }

  // NOTE :- GET Customer data
  Future<int?> postUpdateCustomer(
    int id, {
    required String name,
    required String email,
    required String phone,
    required String phone2,
    required String address,
    required String cityId,
    required String cityName,
    required String socialType,
    required String socialLink,
    required String levelId,
  }) async {
    Response res = await post('customers/$id/update', {
      'name': name,
      'email': email,
      'phone': phone,
      'phone2': phone2,
      'address': address,
      'city_id': cityId,
      'city_name': cityName,
      'social_type': socialType,
      'social_link': socialLink,
      'level_id': levelId
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
    });
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return res.statusCode!;
    }
  }

  // NOTE :- Get Cities
  Future<Map<String, dynamic>?> getCities() async {
    Response res = await get('cities', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
    });
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return {
        'code': res.statusCode!,
        'data': res.statusCode == 200 ? res.body as List<dynamic> : res.body,
      };
    }
  }

  // NOTE :- GET Customer data
  Future<Map<String, dynamic>?> getCustomerOrders(int id,
      {int page = 1}) async {
    Response res = await get('customers/$id/orders?page=$page', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Get.find<AppServices>().accessToken.value}',
    });
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return {
        'code': res.statusCode!,
        'data': res.body as Map<String, dynamic>?,
      };
    }
  }
}
