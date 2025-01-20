import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/shipments/providers/shipments_provider.dart';

import '../controllers/shipments_controller.dart';

class ShipmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShipmentsProvider>(() => ShipmentsProvider());
    Get.lazyPut<ShipmentsController>(() => ShipmentsController());
  }
}
