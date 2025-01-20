import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/all_orders_model/datum.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/order_card.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/order_card_shimmer.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';
import '../controllers/requests_controller.dart';

class RequestsView extends GetView<RequestsController> {
  const RequestsView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.scrollController.addListener(() {
      if (controller.scrollController.position.pixels >=
              controller.scrollController.position.maxScrollExtent - 200 &&
          controller.ordersHasMore &&
          !controller.isLoadingMoreOrders.value) {
        controller.fetchNextOrders();
      }
    });
    return Scaffold(
      appBar:
          AppBar(title: 'الطلبات'.title(), centerTitle: true, elevation: 0.0),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.orders.value = <OrderDatum>[];
          controller.ordersCurrentPage.value = 1;
          controller.ordersLastPage.value = 1;
          controller.getOrders();
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
                        controller: controller.orderSearchController,
                        onSuffixTap: () {
                          controller.orders.value = <OrderDatum>[];
                          controller.ordersCurrentPage.value = 1;
                          controller.ordersLastPage.value = 1;
                          controller.getOrders();
                        },
                      ),
                    ),
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 16 / 15,
                  ),
                  itemBuilder: (context, index) {
                    if (index < orders.length) {
                      return OrderCard(order: orders[index]);
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
    );
  }
}
