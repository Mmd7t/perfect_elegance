import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/providers/api_provider.dart';

class AuthProvider extends ApiProvider {
  // NOTE :- Post Login
  Future<Map<String, dynamic>?> postLogin({
    required String email,
    required String password,
    required String deviceToken,
  }) async {
    Response<Map<String, dynamic>?> res =
        await post<Map<String, dynamic>?>('auth', {
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

  // NOTE :- Post Sign up
  Future<Map<String, dynamic>?> postStoreSignup({
    required String name,
    required String managerName,
    required String phone,
    required String address,
    required String storelink,
    required String passportNumber,
    required String idNumber,
    required String email,
    required String password,
  }) async {
    Response<Map<String, dynamic>?> res = await post<Map<String, dynamic>?>(
      'store-signup',
      {
        'name': name,
        'manager_name': managerName,
        'phone': phone,
        'address': address,
        'storelink': storelink,
        'passport_number': passportNumber,
        'id_number': idNumber,
        'license': true,
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
  Future<Map<String, dynamic>?> postResetPassOtp(
      {required String email}) async {
    Response<Map<String, dynamic>?> res = await post<Map<String, dynamic>?>(
      'forget-password',
      {
        'email': email,
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

  // NOTE :- Post Verify Pass OTP
  Future<Map<String, dynamic>?> postVerifyOtp({
    required String email,
    required String otp,
  }) async {
    Response<Map<String, dynamic>?> res = await post<Map<String, dynamic>?>(
      'verify-otp',
      {'email': email, 'otp': otp},
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

  // NOTE :- Post Reset Pass
  Future<int?> postResetPass({
    required String email,
    required String password,
    required String confirmPassword,
    required String token,
  }) async {
    Response res = await post('update-password', {
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
