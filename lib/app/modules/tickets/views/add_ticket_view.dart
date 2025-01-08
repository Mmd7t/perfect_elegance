import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/global_textfield.dart';

class AddTicketView extends GetView {
  const AddTicketView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "إنشاء تذكرة"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Column(
          children: [
            const GlobalTextField(
              hintText: "عنوان التذكرة",
              title: "عنوان التذكرة",
            ),
            const SizedBox(height: 8),
            const GlobalTextField(
              hintText: "منخفضة",
              title: "الأولوية",
            ),
            const SizedBox(height: 8),
            const GlobalTextField(
              hintText: "اختر",
              title: "الادارة",
            ),
            const SizedBox(height: 8),
            const GlobalTextField(
              hintText: "123456",
              title: "كود الشحن",
            ),
            const SizedBox(height: 8),
            const GlobalTextField(
              hintText: "اكتب",
              title: "محتوى التذكرة",
              maxLines: 4,
            ),
            const SizedBox(height: 40),
            GlobalButton(
              onTap: () {},
              text: "إنشاء",
              width: Get.width,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
