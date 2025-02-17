import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/models/packages_model/datum.dart';
import 'package:perfect_elegance/app/data/models/packages_model/packages_model.dart';
import 'package:perfect_elegance/app/data/services/app_services.dart';
import 'package:perfect_elegance/app/modules/shipments/providers/shipments_provider.dart';

class ShipmentsController extends GetxController {
  final ShipmentsProvider provider = Get.find<ShipmentsProvider>();
  final AppServices appServices = Get.find<AppServices>();

  final ScrollController scrollController = ScrollController();

  final TextEditingController packagesSearchController =
      TextEditingController();

  RxBool isPackagesLoading = false.obs;
  RxInt packagesCurrentPage = 1.obs;
  RxInt packagesLastPage = 1.obs;
  RxList<PackageDatum> orders = <PackageDatum>[].obs;
  Future<void> getAllPackages(
      {bool isLoadMore = false, String status = ""}) async {
    isPackagesLoading.value = true;
    final Map<String, dynamic>? data = await provider.getPackages(
      page: packagesCurrentPage.value,
      id: packagesSearchController.text,
      status: status,
    );

    if (data != null) {
      isPackagesLoading.value = false;
      if (data['code'] == 200) {
        PackagesModel response = PackagesModel.fromJson(data['data']);
        if (isLoadMore) {
          orders.addAll(response.packages!.data);
        } else {
          orders.value = response.packages!.data;
        }
        packagesCurrentPage.value = response.packages!.meta!.currentPage ?? 1;
        packagesLastPage.value = response.packages!.meta!.lastPage ?? 1;
      }
    } else {
      isPackagesLoading.value = false;
    }
  }

  bool get packagesHasMore =>
      packagesCurrentPage.value < packagesLastPage.value;

  RxBool isLoadingMorePackages = false.obs;

  Future<void> fetchNextPackages() async {
    if (packagesHasMore && !isLoadingMorePackages.value) {
      isLoadingMorePackages.value = true;
      packagesCurrentPage.value++;
      await getAllPackages(isLoadMore: true);
      isLoadingMorePackages.value = false;
    }
  }

  @override
  void onReady() {
    getAllPackages();
    super.onReady();
  }

  RxBool isATop = true.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          packagesHasMore &&
          !isLoadingMorePackages.value) {
        fetchNextPackages();
      }
      isATop.value = scrollController.position.pixels == 0;
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
