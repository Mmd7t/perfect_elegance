import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/main/views/menu_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.animation =
        Tween(begin: const Offset(0, 0), end: const Offset(-400, 50)).animate(
      CurvedAnimation(
          parent: controller.animationController!, curve: Curves.easeInOut),
    );
    controller.animation2 = Tween(
      begin: const Offset(0, 0),
      end: const Offset(-350, 50),
    ).animate(
      CurvedAnimation(
          parent: controller.animationController!, curve: Curves.easeInOut),
    );

    if (controller.isMenuOpen.value) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF464BE5),
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
        ),
      );
    }

    return Stack(
      children: [
        const MenuView(),
        AnimatedBuilder(
          animation: controller.animationController!,
          builder: (context, child) => Transform.scale(
            scale: controller.sizeAnimation2!.value,
            child: Transform.translate(
              offset: controller.animation2!.value,
              child: Container(
                width: Get.size.width,
                height: Get.size.height,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.14),
                  borderRadius:
                      BorderRadius.circular(controller.borderAnimation!.value),
                ),
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: controller.animationController!,
          builder: (context, child) {
            return Transform.scale(
              scale: controller.sizeAnimation!.value,
              child: Transform.translate(
                offset: controller.animation!.value,
                child: Obx(
                  () {
                    return AbsorbPointer(
                      absorbing: controller.isMenuOpen.value,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            controller.borderAnimation!.value),
                        child: Scaffold(
                          backgroundColor: const Color(0xFFF0F2F5),
                          body: PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: controller.appServices.pageController,
                            itemBuilder: (context, index) =>
                                controller.appServices.navBarPages[index],
                            itemCount: 5,
                          ),
                          bottomNavigationBar: Obx(
                            () {
                              return Container(
                                height: kBottomNavigationBarHeight + 30,
                                width: Get.width,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: SafeArea(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: List.generate(
                                      5,
                                      (index) => InkWell(
                                        borderRadius: BorderRadius.circular(50),
                                        onTap: () {
                                          controller.appServices.pageController
                                              .jumpToPage(index);
                                          controller.appServices.currentIndex
                                              .value = index;
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            (controller.appServices.currentIndex
                                                            .value ==
                                                        index
                                                    ? controller.appServices
                                                            .activeNavBarIcons[
                                                        index]
                                                    : controller.appServices
                                                        .navBarIcons[index])
                                                .iconColored(),
                                            const SizedBox(height: 2),
                                            controller
                                                .appServices.navBarTitles[index]
                                                .labelMedium(
                                              color: controller.appServices
                                                          .currentIndex.value ==
                                                      index
                                                  ? Get.theme.primaryColor
                                                  : const Color(0xFFD8D8D8),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
