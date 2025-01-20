import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/requests/providers/requests_provider.dart';

import '../controllers/requests_controller.dart';

class RequestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestsProvider>(() => RequestsProvider());
    Get.lazyPut<RequestsController>(() => RequestsController());
  }
}
