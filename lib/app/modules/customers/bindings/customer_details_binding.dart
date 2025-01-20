import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/customers/controllers/customer_details_controller.dart';
import 'package:perfect_elegance/app/modules/customers/providers/customers_provider.dart';

class CustomerDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerProvider>(() => CustomerProvider());
    Get.lazyPut<CustomerDetailsController>(() => CustomerDetailsController());
  }
}
