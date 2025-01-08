import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) => ListTile(
          title: "طلب جديد".titleSmall(),
          subtitle: "Your Post is Trending in the hot Section".bodyMedium(),
          trailing: "9.56 AM".caption(),
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
      ),
    );
  }
}
