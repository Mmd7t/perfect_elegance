import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "الاشعارات"),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (controller.notifications.isEmpty) {
            return Center(child: "لا يوجد اشعارات".bodyMedium());
          } else {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              itemCount: controller.notifications.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) => ListTile(
                title: "${controller.notifications[index].data!.title}"
                    .titleSmall(),
                subtitle: "${controller.notifications[index].data!.body}"
                    .bodyMedium(),
                trailing: Directionality(
                  textDirection: TextDirection.ltr,
                  child: DateFormat("HH:MM a")
                      .format(controller.notifications[index].createdAt!)
                      .caption(),
                ),
                leading: UnconstrainedBox(
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Constants.success,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                titleAlignment: ListTileTitleAlignment.titleHeight,
              ).decorate(),
            );
          }
        }
      }),
    );
  }
}
