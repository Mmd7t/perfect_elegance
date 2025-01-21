import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/profile/widgets/profile_card.dart';
import 'package:perfect_elegance/app/modules/profile/widgets/profile_header.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'المزيد'.title(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ProfileHeader(
              name: controller.appServices.userName.value,
              email: controller.appServices.userEmail.value,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: Get.width,
              child: "الحساب".titleSmall(color: Constants.grey3),
            ),
            const SizedBox(height: 10),
            const ProfileCard(
              title: "الزبائن",
              icon: "user",
              route: Routes.customers,
            ),
            const SizedBox(height: 8),
            const ProfileCard(
              title: "التذاكر",
              icon: "ticketss",
              route: Routes.tickets,
            ),
            const SizedBox(height: 8),
            const ProfileCard(
              title: "كشف حساب",
              icon: "credit",
              route: Routes.accountStatement,
            ),
            const SizedBox(height: 8),
            const ProfileCard(
              title: "توثيق الحساب",
              icon: "verified",
              route: Routes.accountVerified,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: Get.width,
              child: "الاعدادات".titleSmall(color: Constants.grey3),
            ),
            const SizedBox(height: 10),
            const ProfileCard(
              title: "الشروط والأحكام",
              icon: "docu",
              route: Routes.terms,
            ),
            const SizedBox(height: 8),
            Obx(() {
              return SwitchListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                value: controller.isNotificationsChecked.value,
                onChanged: (value) {
                  controller.isNotificationsChecked.value = value;
                  controller.appServices.notificationsOn.value = value;
                },
                trackOutlineColor:
                    const WidgetStatePropertyAll(Colors.transparent),
                inactiveTrackColor: Constants.grey4.withValues(alpha: 0.5),
                tileColor: Constants.grey5.withValues(alpha: 0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: "الاشعارات".body(color: Get.theme.colorScheme.secondary),
                secondary: "noti".iconColored(),
              );
            }),
            const SizedBox(height: 8),
            const ProfileCard(
              title: "سياسة الخصوصية",
              icon: "shield",
              route: Routes.policy,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
