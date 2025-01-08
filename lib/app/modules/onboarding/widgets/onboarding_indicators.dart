import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/onboarding/controllers/onboarding_controller.dart';

class OnboardingIndicators extends GetWidget<OnboardingController> {
  const OnboardingIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              width: 8,
              height: controller.currentPage.value == index ? 18 : 8,
              margin: const EdgeInsetsDirectional.only(end: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: controller.currentPage.value == index
                    ? const Color(0xFFABABFF)
                    : Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
