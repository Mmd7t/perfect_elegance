import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/tickets/providers/tickets_provider.dart';

import '../controllers/tickets_controller.dart';

class TicketsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketsProvider>(() => TicketsProvider());
    Get.lazyPut<TicketsController>(() => TicketsController());
  }
}
