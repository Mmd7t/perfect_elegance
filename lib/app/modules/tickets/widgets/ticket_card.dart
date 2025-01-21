import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/all_tickets_model/ticket.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  const TicketCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "عنوان التذكرة".bodyMedium(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              decoration: BoxDecoration(
                color: ((ticket.status!.color == "success")
                        ? Constants.success
                        : Constants.primary)
                    .withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(5),
              ),
              child: "${ticket.status!.name}".caption(
                  weight: FontWeight.bold,
                  color: (ticket.status!.color == "success")
                      ? Constants.success
                      : Constants.primary),
            ),
          ],
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: Get.width,
          child: "${ticket.title}".titleSmall(),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "تاريخ التذكرة:".bodyMedium(),
                  const SizedBox(height: 5),
                  "الاولوية:".bodyMedium(),
                  const SizedBox(height: 5),
                  "الادارة:".bodyMedium(),
                  const SizedBox(height: 5),
                  "كود الشحن:".bodyMedium(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DateFormat("dd-MM-yyyy")
                      .format(ticket.createdAt!)
                      .subtitle(color: Colors.black),
                  const SizedBox(height: 5),
                  HtmlWidget(
                    ticket.ticketPriority!,
                    customStylesBuilder: (element) {
                      if (element.classes.contains('foo')) {
                        return {'color': 'red'};
                      }

                      return null;
                    },
                    renderMode: RenderMode.column,
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  const SizedBox(height: 5),
                  "${ticket.toManagement}".subtitle(color: Colors.black),
                  const SizedBox(height: 5),
                  "${ticket.vanexTicketId}".subtitle(color: Colors.black),
                ],
              ),
            ),
          ],
        ),
      ],
    ).decorate(padding: 15);
  }
}
