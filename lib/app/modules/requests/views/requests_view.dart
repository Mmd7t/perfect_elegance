import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/enums/enums.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/all_orders_model/datum.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/order_card.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/order_card_shimmer.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/requests_filter_button.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';
import '../controllers/requests_controller.dart';

class RequestsView extends GetView<RequestsController> {
  const RequestsView({super.key});
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
          title: 'الطلبات'.title(),
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
            controller.orders.value = <OrderDatum>[];
            controller.ordersCurrentPage.value = 1;
            controller.ordersLastPage.value = 1;
            controller.orderToDateSearch.value = "";
            controller.orderFromDateSearch.value = "";
            controller.orderStatusSearch.value = OrderStatusSearch.init;
            controller.getOrders();
          },
          backgroundColor: Get.theme.primaryColor,
          color: Colors.white,
          displacement: 0.0,
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
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
                          controller: controller.orderSearchController,
                          onSuffixTap: () {
                            controller.orders.value = <OrderDatum>[];
                            controller.ordersCurrentPage.value = 1;
                            controller.ordersLastPage.value = 1;
                            controller.getOrders();
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      const RequestsFilterButton(),
                    ],
                  ),
                ),
              ),
            ],
            body: RefreshIndicator(
              onRefresh: () async {
                controller.orders.value = <OrderDatum>[];
                controller.ordersCurrentPage.value = 1;
                controller.ordersLastPage.value = 1;
                controller.orderToDateSearch.value = "";
                controller.orderFromDateSearch.value = "";
                controller.orderStatusSearch.value = OrderStatusSearch.init;
                controller.getOrders();
              },
              backgroundColor: Get.theme.primaryColor,
              color: Colors.white,
              displacement: 0.0,
              child: Obx(() {
                final isLoading = controller.isOrdersLoading.value;
                final orders = controller.orders;
                final hasMore = controller.ordersHasMore;
                if (isLoading && orders.isEmpty) {
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
                } else if (orders.isEmpty) {
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
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio:
                          Get.size.shortestSide < 600 ? 16 / 15 : 16 / 8,
                    ),
                    itemBuilder: (context, index) {
                      if (index < orders.length) {
                        return InkWell(
                          onTap: () {
                            controller.appServices.orderId.value =
                                orders[index].id!;
                            Get.toNamed(Routes.requestDetails);
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: OrderCard(order: orders[index]),
                        );
                      } else {
                        return const OrderCardShimmer();
                      }
                    },
                    itemCount: orders.length + (hasMore ? 1 : 0),
                  );
                }
              }),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Get.theme.primaryColor,
          onPressed: () => Get.toNamed(Routes.addRequest),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
