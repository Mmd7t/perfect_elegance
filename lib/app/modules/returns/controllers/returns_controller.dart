import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/models/returns_model/datum.dart';
import 'package:perfect_elegance/app/data/models/returns_model/returns_model.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/returns/providers/returns_provider.dart';

class ReturnsController extends GetxController {
  final ReturnsProvider provider = Get.find<ReturnsProvider>();
  final AppServices appServices = Get.find<AppServices>();

  final ScrollController scrollController = ScrollController();

  RxBool isReturnsLoading = false.obs;
  RxInt returnsCurrentPage = 1.obs;
  RxInt returnsLastPage = 1.obs;
  RxList<ReturnsDatum> returns = <ReturnsDatum>[].obs;
  Future<void> getAllReturns({bool isLoadMore = false}) async {
    isReturnsLoading.value = true;
    final Map<String, dynamic>? data = await provider.getReturns(
      page: returnsCurrentPage.value,
    );

    if (data != null) {
      isReturnsLoading.value = false;
      if (data['code'] == 200) {
        ReturnsModel response = ReturnsModel.fromJson(data['data']);
        if (isLoadMore) {
          returns.addAll(response.products!.data ?? <ReturnsDatum>[]);
        } else {
          returns.value = response.products!.data ?? <ReturnsDatum>[];
        }
        returnsCurrentPage.value = response.products!.meta!.currentPage ?? 1;
        returnsLastPage.value = response.products!.meta!.lastPage ?? 1;
      }
    } else {
      isReturnsLoading.value = false;
    }
  }

  bool get returnsHasMore => returnsCurrentPage.value < returnsLastPage.value;

  RxBool isLoadingMoreReturns = false.obs;

  Future<void> fetchNextOrders() async {
    if (returnsHasMore && !isLoadingMoreReturns.value) {
      isLoadingMoreReturns.value = true;
      returnsCurrentPage.value++;
      await getAllReturns(isLoadMore: true);
      isLoadingMoreReturns.value = false;
    }
  }

  @override
  void onReady() {
    getAllReturns();
    super.onReady();
  }
}
