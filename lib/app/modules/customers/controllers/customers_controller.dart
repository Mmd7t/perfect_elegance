import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/models/customer_model/customer_model.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/customers/providers/customers_provider.dart';

class CustomersController extends GetxController {
  final CustomerProvider provider = Get.find<CustomerProvider>();
  final AppServices appServices = Get.find<AppServices>();
  final TextEditingController customerSearchController =
      TextEditingController();

  RxBool isLoading = false.obs;
  RxList<CustomerModel> customers = <CustomerModel>[].obs;
  getCustomers() async {
    isLoading.value = true;
    final Map<String, dynamic>? response = await provider.getCustomers(
      q: customerSearchController.text,
    );
    isLoading.value = false;

    if (response != null) {
      if (response['code'] == 200) {
        customers.value = response['data']
            .map<CustomerModel>((e) => CustomerModel.fromJson(e))
            .toList();
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
    getCustomers();
  }
}
