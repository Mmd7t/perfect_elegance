import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/all_orders_model/datum.dart';
import 'package:perfect_elegance/app/data/models/all_orders_model/user.dart';
import 'package:perfect_elegance/app/data/models/packages_model/datum.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/order_card.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/order_card_shimmer.dart';
import 'package:perfect_elegance/app/modules/shipments/widgets/shipment_filter_button.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

import '../controllers/shipments_controller.dart';

class ShipmentsView extends GetView<ShipmentsController> {
  const ShipmentsView({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!controller.isATop.value) {
          controller.scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          controller.appServices.pageController.jumpToPage(0);
          controller.appServices.currentIndex.value = 0;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: 'الشحنات'.title(),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              controller.appServices.pageController.jumpToPage(0);
              controller.appServices.currentIndex.value = 0;
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 22),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.orders.value = <PackageDatum>[];
            controller.packagesCurrentPage.value = 1;
            controller.packagesLastPage.value = 1;
            controller.getAllPackages();
          },
          backgroundColor: Get.theme.primaryColor,
          color: Colors.white,
          displacement: 0.0,
          child: NestedScrollView(
            physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SearchCard(
                          text: "بحث..",
                          icon: "search",
                          controller: controller.packagesSearchController,
                          onSuffixTap: () {
                            controller.orders.value = <PackageDatum>[];
                            controller.packagesCurrentPage.value = 1;
                            controller.packagesLastPage.value = 1;
                            controller.getAllPackages();
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      const ShipmentFilterButton(),
                    ],
                  ),
                ),
              ),
            ],
            body: RefreshIndicator(
              onRefresh: () async {
                controller.orders.value = <PackageDatum>[];
                controller.packagesCurrentPage.value = 1;
                controller.packagesLastPage.value = 1;
                controller.getAllPackages();
              },
              backgroundColor: Get.theme.primaryColor,
              color: Colors.white,
              displacement: 0.0,
              child: Obx(() {
                final isLoading = controller.isPackagesLoading.value;
                final packages = controller.orders;
                final hasMore = controller.packagesHasMore;
                if (isLoading && packages.isEmpty) {
                  return GridView.builder(
                    primary: false,
                    controller: controller.scrollController,
                    physics: const BouncingScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 16 / 15,
                    ),
                    itemBuilder: (context, index) {
                      return const OrderCardShimmer();
                    },
                    itemCount: 10,
                  );
                } else if (packages.isEmpty) {
                  return Center(
                    child: 'لا يوجد طلبات'.bodyMedium(),
                  );
                } else {
                  return GridView.builder(
                    primary: false,
                    controller: controller.scrollController,
                    physics: const BouncingScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 16 / 15.5,
                    ),
                    itemBuilder: (context, index) {
                      if (index < packages.length) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            controller.appServices.packageId.value =
                                packages[index].id!;
                            Get.toNamed(Routes.shipmentDetails);
                          },
                          child: OrderCard(
                            order: OrderDatum(
                              id: packages[index].id,
                              user: User(
                                id: packages[index].customer!.id,
                                name: packages[index].customer!.name,
                                phone: packages[index].customer!.phone,
                                email: packages[index].customer!.email,
                                address: packages[index].customer!.address,
                              ),
                              status: packages[index].status,
                              city: packages[index].customer!.address,
                              productsCount:
                                  packages[index].productOrders!.length,
                            ),
                            isPackage: true,
                          ),
                        );
                      } else {
                        return const OrderCardShimmer();
                      }
                    },
                    itemCount: packages.length + (hasMore ? 1 : 0),
                  );
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}
