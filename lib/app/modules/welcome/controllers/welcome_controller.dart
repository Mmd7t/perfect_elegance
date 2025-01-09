import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class WelcomeController extends GetxController {
  final AppServices appServices = Get.find<AppServices>();
  @override
  void onReady() {
    super.onReady();
    startAnimationSequence();
  }

  void startAnimationSequence() {
    Future.delayed(const Duration(seconds: 3), () {
      if (appServices.isFirstTime.value == true) {
        Get.offAllNamed(Routes.onboarding);
      } else {
        if (appServices.accessToken.isEmpty) {
          Get.offAllNamed(Routes.login);
        } else {
          Get.offAllNamed(Routes.main);
        }
      }
    });
  }
}
