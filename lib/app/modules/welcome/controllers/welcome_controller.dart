// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/welcome/providers/welcome_provider.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class WelcomeController extends GetxController {
  final AppServices appServices = Get.find<AppServices>();
  final WelcomeProvider provider = Get.find<WelcomeProvider>();
  @override
  void onReady() {
    super.onReady();
    startAnimationSequence();
  }

  void startAnimationSequence() {
    Future.delayed(const Duration(seconds: 2), () {
      if (appServices.isFirstTime.value == true) {
        Get.offAllNamed(Routes.onboarding);
      } else {
        checkToken();
      }
    });
  }

  checkToken() async {
    // final List<ConnectivityResult> connectivityResult =
    //     await (Connectivity().checkConnectivity());

    // if (connectivityResult.contains(ConnectivityResult.none)) {
    //   Get.offNamed(Routes.noInternet);
    // } else {
    if (appServices.isFirstTime.value) {
      Get.offNamed(Routes.onboarding);
    } else {
      final Map<String, dynamic>? res = await provider.getUser();
      if (res != null) {
        if (res['code'] == 200) {
          appServices.saveUserName(res['data']['data']['name']);
          appServices.saveUserEmail(res['data']['data']['email']);
          appServices.saveUserPhone(res['data']['data']['phone']);
          Get.offNamed(Routes.main);
        } else {
          Get.offNamed(Routes.login);
        }
      } else {
        Ui.errorGetBar(message: "خطأ في الخادم");
      }
    }
    // }
  }
}
