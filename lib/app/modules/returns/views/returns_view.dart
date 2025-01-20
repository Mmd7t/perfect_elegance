import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/detail_card.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/returns_model/datum.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/order_card_shimmer.dart';

import '../controllers/returns_controller.dart';

class ReturnsView extends GetView<ReturnsController> {
  const ReturnsView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.scrollController.addListener(() {
      if (controller.scrollController.position.pixels >=
              controller.scrollController.position.maxScrollExtent - 200 &&
          controller.returnsHasMore &&
          !controller.isLoadingMoreReturns.value) {
        controller.fetchNextOrders();
      }
    });
    return Scaffold(
      appBar: const GlobalAppbar(title: "المرتجعات"),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.returns.value = <ReturnsDatum>[];
          controller.returnsCurrentPage.value = 1;
          controller.returnsLastPage.value = 1;
          controller.getAllReturns();
        },
        backgroundColor: Get.theme.primaryColor,
        color: Colors.white,
        displacement: 0.0,
        child: Obx(() {
          final isLoading = controller.isReturnsLoading.value;
          final returns = controller.returns;
          final hasMore = controller.returnsHasMore;
          if (isLoading && returns.isEmpty) {
            return GridView.builder(
              primary: false,
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          } else if (returns.isEmpty) {
            return Center(
              child: 'لا يوجد مرتجعات'.bodyMedium(),
            );
          } else {
            return ListView.builder(
              primary: false,
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                  .copyWith(bottom: 15),
              itemBuilder: (context, index) {
                if (index < returns.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: DetailCard(
                      id: "SKU : ${returns[index].sku}",
                      subtitles: [
                        "الاسم:".bodyMedium(),
                        const SizedBox(height: 5),
                        "سعر البيع:".bodyMedium(),
                        const SizedBox(height: 5),
                        "سعر الشراء:".bodyMedium(),
                        const SizedBox(height: 5),
                        "المقاس:".bodyMedium(),
                      ],
                      subValues: [
                        "${returns[index].name}".subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        "${returns[index].dinarSellingPrice} د.ل"
                            .subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        "${returns[index].dollarPurchasingPrice} د.ل"
                            .subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        "${returns[index].size}".subtitle(color: Colors.black),
                      ],
                    ),
                  );
                } else {
                  return const OrderCardShimmer();
                }
              },
              itemCount: returns.length + (hasMore ? 1 : 0),
            );
          }
        }),
      ),
    );
  }
}
