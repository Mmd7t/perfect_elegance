import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/models/package_details_model/package_details_model.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/shipments/providers/shipments_provider.dart';

class ShipmentDetailsController extends GetxController {
  final ShipmentsProvider provider = Get.find<ShipmentsProvider>();
  final AppServices appServices = Get.find<AppServices>();

  RxBool isPackagesLoading = false.obs;
  Rx<PackageDetailsModel> packageData = PackageDetailsModel().obs;
  Future<void> getPackageDetails(
      {bool isLoadMore = false, String status = ""}) async {
    isPackagesLoading.value = true;
    final Map<String, dynamic>? data =
        await provider.getPackageDetails(appServices.packageId.value);
    if (data != null) {
      isPackagesLoading.value = false;
      if (data['code'] == 200) {
        packageData.value = PackageDetailsModel.fromJson(data['data']);
      }
    } else {
      isPackagesLoading.value = false;
    }
  }

  Future<void> restorePackage(int id) async {
    Ui.loadingDialog();
    final int? data = await provider.postRestore(id);
    if (data != null) {
      Get.back();
      if (data == 200) {
        Get.back();
        Ui.successGetBar(message: "تم استعادة الشحنة بنجاح");
      }
    } else {
      Get.back();
    }
  }

  @override
  void onReady() {
    getPackageDetails();
    super.onReady();
  }
}
