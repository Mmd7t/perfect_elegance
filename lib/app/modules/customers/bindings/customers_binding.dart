import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/customers/providers/customers_provider.dart';

import '../controllers/customers_controller.dart';

class CustomersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerProvider>(() => CustomerProvider());
    Get.lazyPut<CustomersController>(() => CustomersController());
  }
}
