import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/customer_model/customer_model.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/order_card_shimmer.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

import '../controllers/customers_controller.dart';

class CustomersView extends GetView<CustomersController> {
  const CustomersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "الزبائن"),
      body: NestedScrollView(
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
                      controller: controller.customerSearchController,
                      onSuffixTap: () {
                        controller.customers.value = <CustomerModel>[];
                        controller.getCustomers();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: Obx(
          () {
            if (controller.isLoading.value) {
              return GridView.builder(
                primary: false,
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
            } else {
              if (controller.customers.isEmpty) {
                return Center(child: "لا يوجد زبائن".bodyMedium());
              } else {
                return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 16 / 14,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      controller.appServices.customerId.value =
                          controller.customers[index].id!;
                      Get.toNamed(Routes.customerDetails);
                    },
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                "#${controller.customers[index].id}".subtitle(),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                "user".iconColored(size: 16),
                                const SizedBox(width: 8),
                                "${controller.customers[index].name}"
                                    .bodyMedium(),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                "phone".iconColored(size: 16),
                                const SizedBox(width: 8),
                                "${controller.customers[index].phone}"
                                    .bodyMedium(),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                "location".iconColored(size: 16),
                                const SizedBox(width: 8),
                                "${controller.customers[index].address}"
                                    .bodyMedium(),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                "package".iconColored(size: 16),
                                const SizedBox(width: 8),
                                "${controller.customers[index].ordersCount}"
                                    .bodyMedium(),
                              ],
                            ),
                          ],
                        ).decorate(padding: 12),
                        PositionedDirectional(
                          end: 10,
                          top: 10,
                          child: "block".iconColored(),
                        ),
                      ],
                    ),
                  ),
                  itemCount: controller.customers.length,
                );
              }
            }
          },
        ),
      ),
    );
  }
}
