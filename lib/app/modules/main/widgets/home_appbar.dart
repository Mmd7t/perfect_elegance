import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/main/controllers/main_controller.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppbar({super.key});

  final MainController menuController = Get.find<MainController>();
  final AppServices appServices = Get.find<AppServices>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          menuController.animationController!.forward();
          menuController.isMenuOpen.value = true;
        },
        icon: 'menu'.iconColored(),
      ),
      actions: [
        IconButton(
          onPressed: () => Get.toNamed(Routes.notifications),
          style: IconButton.styleFrom(
            highlightColor: Get.theme.primaryColor.withValues(alpha: 0.2),
            animationDuration: const Duration(milliseconds: 400),
            backgroundColor: Get.theme.primaryColor.withValues(alpha: 0.05),
          ),
          icon: 'search'.iconColored(color: Get.theme.primaryColor, size: 20),
        ),
        IconButton(
          onPressed: () => Get.toNamed(Routes.notifications),
          style: IconButton.styleFrom(
            highlightColor: Get.theme.primaryColor.withValues(alpha: 0.2),
            animationDuration: const Duration(milliseconds: 400),
            backgroundColor: Get.theme.primaryColor.withValues(alpha: 0.05),
          ),
          icon: 'notifications'.iconColored(color: Get.theme.primaryColor),
        ),
        const SizedBox(width: 5),
      ],
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'مرحبا ${appServices.userName.split(' ').first}'.titleSmall(
            color: Constants.black2,
            weight: FontWeight.bold,
          ),
          'مرحبا بعودتك مره اخري'.bodyMedium(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight + 5);
}
