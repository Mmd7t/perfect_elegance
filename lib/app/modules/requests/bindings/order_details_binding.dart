import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/add_order_controller.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/order_details_controller.dart';
import 'package:perfect_elegance/app/modules/requests/providers/requests_provider.dart';

class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestsProvider>(() => RequestsProvider());
    Get.lazyPut<OrderDetailsController>(() => OrderDetailsController());
    Get.lazyPut<AddOrderController>(() => AddOrderController());
  }
}
