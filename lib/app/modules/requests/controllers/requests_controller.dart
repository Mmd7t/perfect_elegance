import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/models/all_orders_model/all_orders_model.dart';
import 'package:perfect_elegance/app/data/models/all_orders_model/datum.dart';
import 'package:perfect_elegance/app/modules/requests/providers/requests_provider.dart';

class RequestsController extends GetxController {
  final RequestsProvider provider = Get.find<RequestsProvider>();
  final ScrollController scrollController = ScrollController();

  final TextEditingController orderSearchController = TextEditingController();
  RxString orderStatusSearch = "".obs;
  RxString orderFromDateSearch = "".obs;
  RxString orderToDateSearch = "".obs;

  RxBool isOrdersLoading = false.obs;
  RxInt ordersCurrentPage = 1.obs;
  RxInt ordersLastPage = 1.obs;
  RxList<OrderDatum> orders = <OrderDatum>[].obs;
  Future<void> getOrders({bool isLoadMore = false}) async {
    isOrdersLoading.value = true;
    final Map<String, dynamic>? data = await provider.getAllOrders(
      page: ordersCurrentPage.value,
      status: orderStatusSearch.value,
      orderId: orderSearchController.text,
      fromDate: orderFromDateSearch.value,
      toDate: orderToDateSearch.value,
    );

    if (data != null) {
      isOrdersLoading.value = false;
      if (data['code'] == 200) {
        AllOrdersModel response = AllOrdersModel.fromJson(data['data']);
        if (isLoadMore) {
          orders.addAll(response.orders!.data ?? <OrderDatum>[]);
        } else {
          orders.value = response.orders!.data ?? <OrderDatum>[];
        }
        ordersCurrentPage.value = response.orders!.meta!.currentPage ?? 1;
        ordersLastPage.value = response.orders!.meta!.lastPage ?? 1;
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
    getOrders();
    super.onReady();
  }
}
