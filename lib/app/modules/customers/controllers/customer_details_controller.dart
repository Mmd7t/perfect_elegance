import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/models/customer_details_model/customer_details_model.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/customers/providers/customers_provider.dart';

class CustomerDetailsController extends GetxController {
  final CustomerProvider provider = Get.find<CustomerProvider>();
  final AppServices appServices = Get.find<AppServices>();

  RxBool isCustomerLoading = false.obs;
  Rx<CustomerDetailsModel> customerData = CustomerDetailsModel().obs;
  Future<void> getCustomerDetails(
      {bool isLoadMore = false, String status = ""}) async {
    isCustomerLoading.value = true;
    final Map<String, dynamic>? data =
        await provider.getCustomerDetails(appServices.customerId.value);
    if (data != null) {
      isCustomerLoading.value = false;
      if (data['code'] == 200) {
        customerData.value = CustomerDetailsModel.fromJson(data['data']);
      }
    } else {
      isCustomerLoading.value = false;
    }
  }

  @override
  void onReady() {
    getCustomerDetails();
    super.onReady();
  }
}
