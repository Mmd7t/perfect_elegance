import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/data/models/city_model/city_model.dart';
import 'package:perfect_elegance/app/data/models/customer_details_model/customer_details_model.dart';
import 'package:perfect_elegance/app/data/models/customer_orders_model/customer_orders_model.dart';
import 'package:perfect_elegance/app/data/models/customer_orders_model/datum.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/customers/providers/customers_provider.dart';

class CustomerDetailsController extends GetxController {
  final CustomerProvider provider = Get.find<CustomerProvider>();
  final AppServices appServices = Get.find<AppServices>();

  final ScrollController scrollController = ScrollController();

  RxBool isCustomerLoading = false.obs;
  Rx<CustomerDetailsModel> customerData = CustomerDetailsModel().obs;
  Future<void> getCustomerDetails() async {
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

  banCustomer(int id) async {
    Ui.loadingDialog();
    final int? res = await provider.postBanCustomer(id);
    Get.back();
    if (res != null) {
      if (res == 200) {
        getCustomerDetails();
        Ui.successGetBar(message: "تم حظر الزبون");
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController phone2Controller = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  RxString cityId = "".obs;
  RxString cityName = "".obs;

  updateCustomer() async {
    Ui.loadingDialog();
    final int? res = await provider.postUpdateCustomer(
      appServices.customerId.value,
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      phone2: phone2Controller.text,
      address: addressController.text,
      cityId: cityId.value,
      cityName: cityName.value,
      socialType: "",
      socialLink: "",
      levelId: "",
    );
    Get.back();

    if (res != null) {
      if (res == 200) {
        Get.back();
        getCustomerDetails();
      } else {
        Get.log("errorrrr");
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  RxBool isCitiesLoading = false.obs;
  RxList<CityModel> cities = <CityModel>[].obs;
  getCities() async {
    isCitiesLoading.value = true;
    final Map<String, dynamic>? res = await provider.getCities();
    isCitiesLoading.value = false;
    if (res != null) {
      if (res['code'] == 200) {
        cities.value =
            res['data'].map<CityModel>((e) => CityModel.fromJson(e)).toList();
      }
    } else {
      Ui.errorGetBar(message: "خطأ في السيرفر");
    }
  }

  RxBool isOrdersLoading = false.obs;
  RxInt ordersCurrentPage = 1.obs;
  RxInt ordersLastPage = 1.obs;
  RxList<CustomerOrderDatum> orders = <CustomerOrderDatum>[].obs;
  Future<void> getOrders({bool isLoadMore = false}) async {
    isOrdersLoading.value = true;
    final Map<String, dynamic>? data = await provider.getCustomerOrders(
      appServices.customerId.value,
      page: ordersCurrentPage.value,
    );

    if (data != null) {
      isOrdersLoading.value = false;
      if (data['code'] == 200) {
        CustomerOrdersModel response =
            CustomerOrdersModel.fromJson(data['data']);
        if (isLoadMore) {
          orders.addAll(response.orders!.data ?? <CustomerOrderDatum>[]);
        } else {
          orders.value = response.orders!.data ?? <CustomerOrderDatum>[];
        }
        ordersCurrentPage.value = response.orders!.currentPage ?? 1;
        ordersLastPage.value = response.orders!.lastPage ?? 1;
      }
    } else {
      isOrdersLoading.value = false;
    }
  }

  bool get ordersHasMore => ordersCurrentPage.value < ordersLastPage.value;

  RxBool isLoadingMoreOrders = false.obs;

  Future<void> fetchNextOrders() async {
    if (ordersHasMore && !isLoadingMoreOrders.value) {
      isLoadingMoreOrders.value = true;
      ordersCurrentPage.value++;
      await getOrders(isLoadMore: true);
      isLoadingMoreOrders.value = false;
    }
  }

  @override
  void onReady() {
    getCustomerDetails();
    getOrders();
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    phone2Controller.dispose();
    emailController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
