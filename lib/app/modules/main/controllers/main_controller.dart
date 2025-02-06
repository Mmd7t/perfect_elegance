import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/models/all_stores_model/all_stores_model.dart';
import 'package:perfect_elegance/app/data/models/home_model.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/requests_controller.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';
import '../providers/home_provider.dart';

class MainController extends GetxController with GetTickerProviderStateMixin {
  final HomeProvider provider = Get.find<HomeProvider>();
  final AppServices appServices = Get.find<AppServices>();
  final RequestsController requestsController = Get.find<RequestsController>();
  AnimationController? animationController;
  Animation? animation,
      animation2,
      sizeAnimation,
      sizeAnimation2,
      borderAnimation;
  RxBool isMenuOpen = false.obs;

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

  RxBool isStoresLoading = false.obs;
  RxList<AllStoresModel> stores = <AllStoresModel>[].obs;
  RxList<AllStoresModel> filteredStores = <AllStoresModel>[].obs;
  getStores() async {
    isStoresLoading.value = true;
    final Map<String, dynamic>? res = await provider.getAllStores();
    isStoresLoading.value = false;
    if (res != null) {
      if (res['code'] == 200) {
        stores.value = res['data']
            .map<AllStoresModel>((e) => AllStoresModel.fromJson(e))
            .toList();
        filteredStores.value = stores;
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  RxInt selectedIndex = 0.obs;

  void filterItems(String query) {
    filteredStores.value = stores
        .where((item) => item.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (filteredStores.isEmpty ||
        !filteredStores.contains(stores[selectedIndex.value])) {
      selectedIndex.value = 0;
    }
  }

  selectStore(int id) async {
    Ui.loadingDialog();
    final Map<String, dynamic>? res = await provider.postSelectStore(id);
    Get.back();
    if (res != null) {
      if (res['code'] == 200) {
        Ui.successGetBar(message: "تم تغيير المتجر بنجاح");
        Get.offAllNamed(Routes.splash);
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  @override
  void onReady() {
    super.onReady();
    getHomeData();
    getStores();
  }
}
