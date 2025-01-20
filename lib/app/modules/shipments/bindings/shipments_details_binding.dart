import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/shipments/controllers/shipment_details_controller.dart';
import 'package:perfect_elegance/app/modules/shipments/providers/shipments_provider.dart';

class ShipmentDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShipmentsProvider>(() => ShipmentsProvider());
    Get.lazyPut<ShipmentDetailsController>(() => ShipmentDetailsController());
  }
}
