import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/onboarding/widgets/onboarding_part.dart';

class OnboardingController extends GetxController {
  final List<Widget> onboardingpages = [
    const OnboardingPart(
      title: "تابع متجرك بسهولة",
      image: 'onboarding1',
      subtitle:
          "قم بمراقبة جميع الأنشطة والمنتجات في متجرك في مكان واحد، وابقَ على اطلاع دائم بكل جديد.",
    ),
    const OnboardingPart(
      title: "تابع شحنتك بسهولة",
      image: 'onboarding2',
      subtitle:
          "قم بمراقبة جميع الأنشطة والمنتجات في متجرك في مكان واحد، وابقَ على اطلاع دائم بكل جديد.",
    ),
    const OnboardingPart(
      title: "احصل علي طلبك بسرعة",
      image: 'onboarding3',
      subtitle:
          "قم بمراقبة جميع الأنشطة والمنتجات في متجرك في مكان واحد، وابقَ على اطلاع دائم بكل جديد.",
    ),
  ];

  RxInt currentPage = 0.obs;

  final PageController pageController = PageController();
}
