import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/main/controllers/main_controller.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class MenuView extends GetView<MainController> {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      extendBodyBehindAppBar: true,
      body: InkWell(
        onTap: () {
          controller.animationController!.reverse();
          controller.isMenuOpen.value = false;
        },
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF040083),
                Color(0xFF464BE5),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kToolbarHeight + 10),
              IconButton(
                onPressed: () {
                  controller.animationController!.reverse();
                  controller.isMenuOpen.value = false;
                },
                icon: const Icon(Icons.close, color: Colors.white),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: "profile".iconColored(),
                title: "الملف الشخصي".button(color: Colors.white),
                onTap: () {
                  controller.animationController!.reverse();
                  controller.isMenuOpen.value = false;
                  controller.appServices.pageController.jumpToPage(4);
                  controller.appServices.currentIndex.value = 4;
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: "requests-menu".iconColored(),
                title: "الطلبات".button(color: Colors.white),
                onTap: () {
                  controller.animationController!.reverse();
                  controller.isMenuOpen.value = false;
                  controller.appServices.pageController.jumpToPage(1);
                  controller.appServices.currentIndex.value = 1;
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: "users".iconColored(),
                title: "الزبائن".button(color: Colors.white),
                onTap: () {
                  controller.animationController!.reverse();
                  controller.isMenuOpen.value = false;
                  Get.toNamed(Routes.customers);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: "shipments".iconColored(),
                title: "الشحنات".button(color: Colors.white),
                onTap: () {
                  controller.animationController!.reverse();
                  controller.isMenuOpen.value = false;
                  controller.appServices.pageController.jumpToPage(2);
                  controller.appServices.currentIndex.value = 2;
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: "returns".iconColored(),
                title: "المرتجعات".button(color: Colors.white),
                onTap: () {
                  controller.animationController!.reverse();
                  controller.isMenuOpen.value = false;
                  Get.toNamed(Routes.returns);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: "settlement-menu".iconColored(),
                title: "التسويات".button(color: Colors.white),
                onTap: () {
                  controller.animationController!.reverse();
                  controller.isMenuOpen.value = false;
                  controller.appServices.pageController.jumpToPage(3);
                  controller.appServices.currentIndex.value = 3;
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: "credit-card".iconColored(),
                title: "كشف حساب".button(color: Colors.white),
                onTap: () {
                  controller.animationController!.reverse();
                  controller.isMenuOpen.value = false;
                  Get.toNamed(Routes.accountStatement);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: "tickets".iconColored(),
                title: "تذاكر الدعم".button(color: Colors.white),
                onTap: () {
                  controller.animationController!.reverse();
                  controller.isMenuOpen.value = false;
                  Get.toNamed(Routes.tickets);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 5),
              ListTile(
                leading: "policy".iconColored(),
                title: "السياسات".button(color: Colors.white),
                onTap: () {
                  controller.animationController!.reverse();
                  controller.isMenuOpen.value = false;
                  Get.toNamed(Routes.policy);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const Spacer(),
              ListTile(
                leading: "logout".iconColored(),
                title: "تسجيل الخروج".button(color: Colors.white),
                onTap: () {
                  controller.animationController!.reverse();
                  controller.isMenuOpen.value = false;
                  Get.generalDialog(
                    barrierDismissible: true,
                    barrierLabel: 'logout',
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Dialog(
                      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 15),
                            "تسجيل الخروج".titleSmall(),
                            const SizedBox(height: 10),
                            "سوف تحتاج إلى إدخال اسم المستخدم وكلمة المرور في المرة القادمة التي تريد فيها تسجيل الدخول"
                                .bodyMedium(center: true),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      Get.back();
                                      controller.logout();
                                    },
                                    child: "تسجيل خروج"
                                        .button(color: Constants.cancel),
                                  ),
                                ),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () => Get.back(),
                                    child: "إلغاء"
                                        .button(color: Constants.primary),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
