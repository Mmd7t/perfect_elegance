import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

import '../controllers/tickets_controller.dart';

class TicketsView extends GetView<TicketsController> {
  const TicketsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "التذاكر"),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "عنوان التذكرة".bodyMedium(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  decoration: BoxDecoration(
                    color: Constants.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: "جديدة".titleSmall(color: Constants.primary),
                ),
              ],
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: Get.width,
              child: "تذكرة منتج".titleSmall(),
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
                      "24-4-2024".subtitle(color: Colors.black),
                      const SizedBox(height: 5),
                      "منخفضة".subtitle(color: Colors.black),
                      const SizedBox(height: 5),
                      "الادارة المالية".subtitle(color: Colors.black),
                      const SizedBox(height: 5),
                      "N66565k454540".subtitle(color: Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ).decorate(padding: 15),
      ),
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
