import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/models/all_stores_model/all_stores_model.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';
import '../providers/home_provider.dart';

class StoresController extends GetxController with GetTickerProviderStateMixin {
  final HomeProvider provider = Get.find<HomeProvider>();
  final AppServices appServices = Get.find<AppServices>();

  RxBool isStoresLoading = false.obs;
  RxList<AllStoresModel> stores = <AllStoresModel>[].obs;
  getStores() async {
    isStoresLoading.value = true;
    final Map<String, dynamic>? res = await provider.getAllStores();
    isStoresLoading.value = false;
    if (res != null) {
      if (res['code'] == 200) {
        stores.value = res['data']
            .map<AllStoresModel>((e) => AllStoresModel.fromJson(e))
            .toList();
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  selectStore(int id) async {
    Ui.loadingDialog();
    final Map<String, dynamic>? res = await provider.postSelectStore(id);
    Get.back();
    if (res != null) {
      if (res['code'] == 200) {
        Get.offAllNamed(Routes.main);
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  @override
  void onReady() {
    super.onReady();
    getStores();
  }
}
