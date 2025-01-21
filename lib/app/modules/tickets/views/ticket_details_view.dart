import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/global_textfield.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/all_tickets_model/status.dart';
import 'package:perfect_elegance/app/data/models/all_tickets_model/ticket.dart';
import 'package:perfect_elegance/app/modules/tickets/controllers/ticket_details_controller.dart';
import 'package:perfect_elegance/app/modules/tickets/widgets/ticket_card.dart';

class TicketDetailsView extends GetView<TicketDetailsController> {
  const TicketDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "عرض التذكرة"),
      body: Obx(() {
        if (controller.isTicketDetailsLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (controller.ticket.value.ticket == null) {
            return const Center(child: Text("لا توجد بيانات"));
          } else {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TicketCard(
                          ticket: Ticket(
                            id: controller.ticket.value.ticket!.id,
                            title: controller.ticket.value.ticket!.title,
                            createdAt:
                                controller.ticket.value.ticket!.createdAt,
                            toManagement:
                                controller.ticket.value.ticket!.toManagement,
                            vanexTicketId:
                                controller.ticket.value.ticket!.vanexTicketId,
                            ticketPriority:
                                controller.ticket.value.ticket!.ticketPriority,
                            status: Status(
                              id: controller.ticket.value.ticket!.statusId,
                              color: controller.ticket.value.status!
                                  .where((e) =>
                                      e.id ==
                                      controller.ticket.value.ticket!.statusId)
                                  .toList()
                                  .first
                                  .color,
                              name: controller.ticket.value.status!
                                  .where((e) =>
                                      e.id ==
                                      controller.ticket.value.ticket!.statusId)
                                  .toList()
                                  .first
                                  .name,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListTile(
                          onTap: () {
                            showGeneralDialog(
                              context: context,
                              barrierDismissible: true,
                              barrierLabel: 'ticket reply',
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      Center(
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 30),
                                      "أضف رد على التذكرة"
                                          .titleSmall(color: Colors.black),
                                      const SizedBox(height: 20),
                                      Material(
                                        child: GlobalTextField(
                                          controller:
                                              controller.replyContentController,
                                          hintText: "موضوع التذكرة",
                                          title: "رد التذكرة",
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      GlobalButton(
                                        onTap: () {
                                          if (controller
                                              .replyContentController.text
                                              .trim()
                                              .isNotEmpty) {
                                            Get.back();
                                            controller.replyToTicket(
                                              controller
                                                  .ticket.value.ticket!.id!,
                                              controller.ticket.value.ticket!
                                                  .statusId!,
                                            );
                                          }
                                        },
                                        text: "ارسال",
                                        width: 180,
                                      ),
                                      const SizedBox(height: 30),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          leading: "reply".iconColored(size: 20),
                          title: "رد".subtitle(),
                        ).decorate(),
                        const SizedBox(height: 20),
                        if (controller
                            .ticket.value.ticket!.replies!.isNotEmpty) ...{
                          SizedBox(
                            width: Get.width,
                            child: "التعليقات".titleSmall(color: Colors.black),
                          ),
                        } else ...{
                          Center(
                            child: "لا يوجد تعليقات"
                                .bodyMedium(color: Colors.black),
                          ),
                        },
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                if (controller.ticket.value.ticket!.replies != null)
                  SliverList.separated(
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: controller.ticket.value.ticket!
                                        .replies![index].userType! ==
                                    "admin"
                                ? Get.theme.primaryColor
                                : Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/logo.png"),
                                radius: 22,
                              ),
                              const SizedBox(width: 10),
                              (controller.ticket.value.ticket!.replies![index]
                                              .userType ==
                                          "admin"
                                      ? "Admin"
                                      : controller.appServices.userName.value)
                                  .titleSmall(color: Colors.black),
                            ],
                          ),
                          const SizedBox(height: 10),
                          "${controller.ticket.value.ticket!.replies![index].description}"
                              .bodyMedium(color: Colors.black87),
                          const SizedBox(height: 10),
                          DateFormat("dd-MM-yyyy , hh:mm a")
                              .format(controller.ticket.value.ticket!
                                  .replies![index].createdAt!)
                              .caption(),
                        ],
                      ),
                    ).decorate(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: controller.ticket.value.ticket!.replies!.length,
                  ),
              ],
            );
          }
        }
      }),
    );
  }
}
