import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/models/home_model.dart';
import 'package:perfect_elegance/app/modules/main/views/home_view.dart';
import 'package:perfect_elegance/app/modules/profile/views/profile_view.dart';
import 'package:perfect_elegance/app/modules/requests/views/requests_view.dart';
import 'package:perfect_elegance/app/modules/settlements/views/settlements_view.dart';
import 'package:perfect_elegance/app/modules/shipments/views/shipments_view.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';
import '../providers/home_provider.dart';

class MainController extends GetxController with GetTickerProviderStateMixin {
  final HomeProvider provider = Get.find<HomeProvider>();
  AnimationController? animationController;
  Animation? animation,
      animation2,
      sizeAnimation,
      sizeAnimation2,
      borderAnimation;
  RxBool isMenuOpen = false.obs;
  RxInt currentIndex = 0.obs;
  final List<String> navBarIcons = [
    'home',
    'request',
    'truck',
    'settlement',
    'settings',
  ];
  final List<String> activeNavBarIcons = [
    'home-fill',
    'request-fill',
    'truck-fill',
    'settlement-fill',
    'settings-fill',
  ];
  final List<String> navBarTitles = [
    'الرئيسية',
    'الطلبات',
    'الشحنات',
    'التسوية',
    'حسابي',
  ];

  final List<Widget> navBarPages = [
    const HomeView(),
    const RequestsView(),
    const ShipmentsView(),
    const SettlementsView(),
    const ProfileView(),
  ];

  final PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    borderAnimation = Tween(begin: 0.0, end: 35.0).animate(
      CurvedAnimation(parent: animationController!, curve: Curves.easeInOut),
    );
    sizeAnimation = Tween(begin: 1.0, end: 0.65).animate(
      CurvedAnimation(parent: animationController!, curve: Curves.easeInOut),
    );
    sizeAnimation2 = Tween(begin: 1.0, end: 0.55).animate(
      CurvedAnimation(parent: animationController!, curve: Curves.easeInOut),
    );
  }

  Rx<HomeModel> homeModel = HomeModel().obs;
  RxBool isLoading = false.obs;
  getHomeData() async {
    isLoading.value = true;
    final Map<String, dynamic>? res = await provider.getHomeData();
    isLoading.value = false;
    if (res != null) {
      if (res['code'] == 200) {
        homeModel.value = HomeModel.fromJson(res['data']);
      } else {}
    } else {}
  }

  logout() async {
    Ui.loadingDialog();
    await provider.getLogout();
    Get.back();
    Get.offAllNamed(Routes.login);
  }

  @override
  void onReady() {
    super.onReady();
    getHomeData();
  }
}
