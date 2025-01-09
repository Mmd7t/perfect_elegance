import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/auth/providers/auth_provider.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final AppServices appServices = Get.find<AppServices>();
  final AuthProvider provider = Get.find<AuthProvider>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxString email = ''.obs;
  RxString password = ''.obs;

  RxBool isPassObsecure = true.obs;

  login() async {
    Ui.loadingDialog();
    final Map<String, dynamic>? res = await provider.postLogin(
      email: email.value,
      password: password.value,
      deviceToken: 'test',
    );
    Get.back();
    if (res != null) {
      if (res['code'] == 200) {
        appServices.saveAccessToken(res['data']['token']);
        Get.offNamed(Routes.main);
      } else {}
    } else {}
  }
}
