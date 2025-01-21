import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/tickets/widgets/ticket_card.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';
import '../controllers/tickets_controller.dart';

class TicketsView extends GetView<TicketsController> {
  const TicketsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "التذاكر"),
      body: Obx(() {
        if (controller.isTicketsLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (controller.tickets.isEmpty) {
            return Center(child: "لا يوجد تذاكر".bodyMedium());
          } else {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              itemCount: controller.tickets.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  controller.appServices.ticketId.value =
                      controller.tickets[index].id!;
                  Get.toNamed(Routes.ticketDetails);
                },
                borderRadius: BorderRadius.circular(10),
                child: TicketCard(ticket: controller.tickets[index]),
              ),
            );
          }
        }
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.addTicket),
        shape: const CircleBorder(),
        backgroundColor: Constants.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
