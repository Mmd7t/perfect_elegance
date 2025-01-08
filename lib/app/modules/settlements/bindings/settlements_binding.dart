import 'package:get/get.dart';

import '../controllers/settlements_controller.dart';

class SettlementsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettlementsController>(
      () => SettlementsController(),
    );
  }
}
