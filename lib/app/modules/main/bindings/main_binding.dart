import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/main/providers/home_provider.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeProvider>(
      () => HomeProvider(),
    );
    Get.lazyPut<MainController>(
      () => MainController(),
    );
  }
}
