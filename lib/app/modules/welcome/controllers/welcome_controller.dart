import 'package:get/get.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class WelcomeController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    startAnimationSequence();
  }

  void startAnimationSequence() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.onboarding);
    });
  }
}
