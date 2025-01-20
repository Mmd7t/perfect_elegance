import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/enums/enums.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/models/all_tickets_model/all_tickets_model.dart';
import 'package:perfect_elegance/app/data/models/all_tickets_model/ticket.dart';
import 'package:perfect_elegance/app/data/models/error_response_model/error_response_model.dart';
import 'package:perfect_elegance/app/modules/tickets/providers/tickets_provider.dart';

class TicketsController extends GetxController {
  final TicketsProvider provider = Get.find<TicketsProvider>();

  RxBool isTicketsLoading = false.obs;
  RxList<Ticket> tickets = <Ticket>[].obs;
  getTickets() async {
    isTicketsLoading.value = true;
    Map<String, dynamic>? response = await provider.getAllTickets();
    isTicketsLoading.value = false;

    if (response != null) {
      if (response['code'] == 200) {
        tickets.addAll(AllTicketsModel.fromJson(response['data']).tickets);
      }
    } else {
      Ui.errorGetBar(message: "خطأ في الخادم");
    }
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString title = "".obs;
  RxString body = "".obs;
  Rx<TicketPriority> priority = TicketPriority.low.obs;
  RxString management = "".obs;
  RxString packageCode = "".obs;
  addNewTicket() async {
    Ui.loadingDialog();
    Map<String, dynamic>? res = await provider.postStore(
      title: title.value,
      body: body.value,
      priority: priority.value.name.capitalizeFirst!,
      management: management.value,
      packageCode: packageCode.value,
    );
    Get.back();

    if (res == null) {
      Ui.errorGetBar(message: "خطأ في الخادم");
    } else {
      if (res['code'] == 200) {
        Get.back();
        Ui.successGetBar(message: "تم انشاء التذكرة بنجاح");
      } else if (res['code'] == 422) {
        ErrorResponseModel errorResponse =
            ErrorResponseModel.fromJson(res['data']);
        Ui.errorGetBar(
          message: errorResponse.errors!.values
              .map((e) => '$e')
              .join('\n')
              .replaceAll(RegExp(r'[\[\]]'), ''),
        );
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
    getTickets();
  }
}
