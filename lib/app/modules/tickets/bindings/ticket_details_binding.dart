import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/tickets/controllers/ticket_details_controller.dart';
import 'package:perfect_elegance/app/modules/tickets/providers/tickets_provider.dart';

class TicketDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketsProvider>(() => TicketsProvider());
    Get.lazyPut<TicketDetailsController>(() => TicketDetailsController());
  }
}
