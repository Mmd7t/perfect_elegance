import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/returns/providers/returns_provider.dart';

import '../controllers/returns_controller.dart';

class ReturnsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReturnsProvider>(() => ReturnsProvider());
    Get.lazyPut<ReturnsController>(() => ReturnsController());
  }
}
