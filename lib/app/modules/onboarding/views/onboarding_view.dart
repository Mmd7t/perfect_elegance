import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:perfect_elegance/app/modules/onboarding/widgets/onboarding_indicators.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primary,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Constants.primary,
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: "logo.png".assetImage,
                  ),
                  "تطبيق احترافي لأعمال التجارة\nالإلكترونية الخاصة بك"
                      .bodyMedium(color: Colors.white),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              reverse: false,
              controller: controller.pageController,
              onPageChanged: (value) => controller.currentPage.value = value,
              itemBuilder: (context, index) =>
                  controller.onboardingpages[index],
              itemCount: controller.onboardingpages.length,
            ),
          ),
          const OnboardingIndicators(),
          const SizedBox(height: 40),
          Obx(() {
            return GlobalButton(
              onTap: () {
                if (controller.currentPage.value != 2) {
                  controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  Get.offNamed(Routes.login);
                }
              },
              text: controller.currentPage.value != 2 ? "التالي" : "ابدأ الآن",
              width: Get.width * 0.4,
              color: const Color(0xFFE8E8FF),
              textColor: Constants.primary,
            );
          }),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
