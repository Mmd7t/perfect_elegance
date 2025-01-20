import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/welcome/providers/welcome_provider.dart';
import '../controllers/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeProvider>(() => WelcomeProvider());
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
