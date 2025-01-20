import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/settlements/providers/settlements_provider.dart';

import '../controllers/settlements_controller.dart';

class SettlementsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettlementsProvider>(() => SettlementsProvider());
    Get.lazyPut<SettlementsController>(() => SettlementsController());
  }
}
