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

  // // NOTE :- Post New Customer
  // Future<Map<String, dynamic>?> postNewCustomer(
  //     {required String name,
  //     required String email,
  //     required String phone,
  //     required String phone2,
  //     required String address,
  //     required String cityId,
  //     required String cityName,
  //     required String socialType,
  //     required String socialLink,
  //     required String levelId}) async {
  //   Response<Map<String, dynamic>?> res =
  //       await post<Map<String, dynamic>?>('customers/store', {
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //     'phone2': phone2,
  //     'address': address,
  //     'city_id': cityId,
  //     'city_name': cityName,
  //     'social_type': socialType,
  //     'social_link': socialLink,
  //     'level_id': levelId
  //   }, headers: {
  //     'Accept': 'application/json'
  //   });
  //   if (res.status.isServerError || res.status.connectionError) {
  //     return null;
  //   } else {
  //     Get.log(res.statusCode.toString());
  //     return {
  //       'code': res.statusCode!,
  //       'data': res.body as Map<String, dynamic>,
  //     };
  //   }
  // }

  // // NOTE :- Post Login
  // Future<Map<String, dynamic>?> postStoreSignup({
  //   required String name,
  //   required String managerName,
  //   required String phone,
  //   required String address,
  //   required String storelink,
  //   required String passportNumber,
  //   required String idNumber,
  //   required String license,
  //   required String email,
  //   required String password,
  // }) async {
  //   Response<Map<String, dynamic>?> res = await post<Map<String, dynamic>?>(
  //     'api/v1/store-signup',
  //     {
  //       'name': name,
  //       'manager_name': managerName,
  //       'phone': phone,
  //       'address': address,
  //       'storelink': storelink,
  //       'passport_number': passportNumber,
  //       'id_number': idNumber,
  //       'license': license,
  //       'email': email,
  //       'password': password,
  //     },
  //     headers: {'Accept': 'application/json'},
  //   );
  //   if (res.status.isServerError || res.status.connectionError) {
  //     return null;
  //   } else {
  //     Get.log(res.statusCode.toString());
  //     return {
  //       'code': res.statusCode!,
  //       'data': res.body as Map<String, dynamic>,
  //     };
  //   }
  // }

  // // NOTE :- Post Reset Pass OTP
  // Future<int?> postResetPassOtp({required String email}) async {
  //   Response<Map<String, dynamic>?> res = await post<Map<String, dynamic>?>(
  //     'api/v1/forget-password',
  //     {
  //       'email': email,
  //     },
  //     headers: {'Accept': 'application/json'},
  //   );
  //   if (res.status.isServerError || res.status.connectionError) {
  //     return null;
  //   } else {
  //     Get.log(res.statusCode.toString());
  //     return res.statusCode!;
  //   }
  // }

  // // NOTE :- Post Verify Pass OTP
  // Future<int?> postVerifyOtp({
  //   required String email,
  //   required String otp,
  // }) async {
  //   Response res = await post(
  //     'api/v1/verify-otp',
  //     {'email': email, 'otp': otp},
  //     headers: {'Accept': 'application/json'},
  //   );
  //   if (res.status.isServerError || res.status.connectionError) {
  //     return null;
  //   } else {
  //     Get.log(res.statusCode.toString());
  //     return res.statusCode!;
  //   }
  // }

  // // NOTE :- Post Reset Pass
  // Future<int?> postResetPass({
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  //   required String token,
  // }) async {
  //   Response res = await post('api/v1/update-password', {
  //     'email': email,
  //     'password': password,
  //     'password_confirmation': confirmPassword,
  //     'token': token,
  //   }, headers: {
  //     'Accept': 'application/json'
  //   });
  //   if (res.status.isServerError || res.status.connectionError) {
  //     return null;
  //   } else {
  //     Get.log(res.statusCode.toString());
  //     return res.statusCode!;
  //   }
  // }
}
