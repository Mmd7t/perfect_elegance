import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/models/ticket_details_model/ticket_details_model.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/tickets/providers/tickets_provider.dart';

class TicketDetailsController extends GetxController {
  final TicketsProvider provider = Get.find<TicketsProvider>();
  final AppServices appServices = Get.find<AppServices>();

  final TextEditingController replyContentController = TextEditingController();

  RxBool isTicketDetailsLoading = false.obs;
  Rx<TicketDetailsModel> ticket = TicketDetailsModel().obs;
  getTicketDetails() async {
    isTicketDetailsLoading.value = true;
    Map<String, dynamic>? response =
        await provider.getShowTicket(appServices.ticketId.value);
    isTicketDetailsLoading.value = false;

    if (response != null) {
      if (response['code'] == 200) {
        ticket.value = TicketDetailsModel.fromJson(response['data']);
      }
    } else {
      Ui.errorGetBar(message: "خطأ في الخادم");
    }
  }

  Future<void> replyToTicket(int ticketId, int statusId) async {
    Ui.loadingDialog();
    final Map<String, dynamic>? data = await provider.postAddReplyToTicket(
        id: ticketId, reply: replyContentController.text, statusId: statusId);
    Get.back();
    if (data != null) {
      if (data['code'] == 200) {
        getTicketDetails();
        replyContentController.clear();
      } else {
        Ui.errorGetBar(message: data['data']);
      }
    } else {
      Ui.errorGetBar(message: "خطأ في اضافة رد تذكرة");
    }
  }

  @override
  void onReady() {
    super.onReady();
    getTicketDetails();
  }
}
