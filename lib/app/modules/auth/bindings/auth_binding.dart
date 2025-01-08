import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/auth/controllers/otp_controller.dart';
import 'package:perfect_elegance/app/modules/auth/providers/auth_provider.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<OtpController>(() => OtpController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
