import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/providers/api_provider.dart';

class CustomerProvider extends ApiProvider {
  // NOTE :- Post Login
  Future<Map<String, dynamic>?> postLogin(
      {required String email,
      required String password,
      required String deviceToken}) async {
    Response<Map<String, dynamic>?> res =
        await post<Map<String, dynamic>?>('api/v1/auth', {
      'email': email,
      'password': password,
      'device_token': deviceToken,
    }, headers: {
      'Accept': 'application/json'
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

  // NOTE :- Post Login
  Future<Map<String, dynamic>?> postStoreSignup({
    required String name,
    required String managerName,
    required String phone,
    required String address,
    required String storelink,
    required String passportNumber,
    required String idNumber,
    required String license,
    required String email,
    required String password,
  }) async {
    Response<Map<String, dynamic>?> res = await post<Map<String, dynamic>?>(
      'api/v1/store-signup',
      {
        'name': name,
        'manager_name': managerName,
        'phone': phone,
        'address': address,
        'storelink': storelink,
        'passport_number': passportNumber,
        'id_number': idNumber,
        'license': license,
        'email': email,
        'password': password,
      },
      headers: {'Accept': 'application/json'},
    );
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

  // NOTE :- Post Reset Pass OTP
  Future<int?> postResetPassOtp({required String email}) async {
    Response<Map<String, dynamic>?> res = await post<Map<String, dynamic>?>(
      'api/v1/forget-password',
      {
        'email': email,
      },
      headers: {'Accept': 'application/json'},
    );
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return res.statusCode!;
    }
  }

  // NOTE :- Post Verify Pass OTP
  Future<int?> postVerifyOtp({
    required String email,
    required String otp,
  }) async {
    Response res = await post(
      'api/v1/verify-otp',
      {'email': email, 'otp': otp},
      headers: {'Accept': 'application/json'},
    );
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return res.statusCode!;
    }
  }

  // NOTE :- Post Reset Pass
  Future<int?> postResetPass({
    required String email,
    required String password,
    required String confirmPassword,
    required String token,
  }) async {
    Response res = await post('api/v1/update-password', {
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
      'token': token,
    }, headers: {
      'Accept': 'application/json'
    });
    if (res.status.isServerError || res.status.connectionError) {
      return null;
    } else {
      Get.log(res.statusCode.toString());
      return res.statusCode!;
    }
  }
}
