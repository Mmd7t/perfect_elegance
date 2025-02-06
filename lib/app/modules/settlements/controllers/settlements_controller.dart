import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/models/settlements_model/settlements_model.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/settlements/providers/settlements_provider.dart';

class SettlementsController extends GetxController {
  final SettlementsProvider provider = Get.find<SettlementsProvider>();
  final AppServices appServices = Get.find<AppServices>();

  RxBool isSettlementsLoading = false.obs;
  Rx<SettlementsModel> settlements = SettlementsModel().obs;
  getSettlements() async {
    isSettlementsLoading.value = true;
    Map<String, dynamic>? response = await provider.getSettlements();
    isSettlementsLoading.value = false;

    if (response != null) {
      if (response['code'] == 200) {
        settlements.value = SettlementsModel.fromJson(response['data']);
      }
    } else {
      Ui.errorGetBar(message: "خطأ في الخادم");
    }
  }

  @override
  void onReady() {
    super.onReady();
    getSettlements();
  }
}
