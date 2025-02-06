import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:perfect_elegance/app/core/widgets/detail_card.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/customers/controllers/customer_details_controller.dart';
import 'package:perfect_elegance/app/modules/customers/widgets/fab.dart';

class CustomerDetailsView extends GetView<CustomerDetailsController> {
  const CustomerDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "بيانات الزبائن"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Obx(() {
                if (controller.isCustomerLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (controller.customerData.value.customer == null) {
                    return Center(child: "لا يوجد بيانات".bodyMedium());
                  } else {
                    return Column(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "${controller.customerData.value.customer!.name}"
                                    .titleSmall(),
                                if (controller
                                        .customerData.value.customer!.active ==
                                    0)
                                  "حظر".caption(
                                    color: Constants.cancel,
                                    weight: FontWeight.bold,
                                  ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      "تاريخ الانشاء:".bodyMedium(),
                                      const SizedBox(height: 8),
                                      "رقم الهاتف:".bodyMedium(),
                                      const SizedBox(height: 8),
                                      "المدينة:".bodyMedium(),
                                      const SizedBox(height: 8),
                                      "العنوان:".bodyMedium(),
                                      const SizedBox(height: 8),
                                      "عدد الطلبيات:".bodyMedium(),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DateFormat("dd-MM-yyyy")
                                          .format(controller.customerData.value
                                              .customer!.createdAt!)
                                          .subtitle(),
                                      const SizedBox(height: 8),
                                      "${controller.customerData.value.customer!.phone}"
                                          .subtitle(),
                                      const SizedBox(height: 8),
                                      "${controller.customerData.value.customer!.cityName}"
                                          .subtitle(),
                                      const SizedBox(height: 8),
                                      "${controller.customerData.value.customer?.address ?? ""}"
                                          .subtitle(),
                                      const SizedBox(height: 8),
                                      "${controller.customerData.value.customer!.ordersCount ?? 0}"
                                          .subtitle(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ).decorate(padding: 15),
                        const SizedBox(height: 15),
                        if (controller
                            .customerData.value.storeOrders!.data.isNotEmpty)
                          SizedBox(
                            width: Get.width,
                            child: "الطلبيات".titleSmall(),
                          ),
                        const SizedBox(height: 10),
                      ],
                    );
                  }
                }
              }),
            ),
          ],
          physics: const BouncingScrollPhysics(),
          body: Obx(() {
            final isLoading = controller.isOrdersLoading.value;
            final orders = controller.orders;
            final hasMore = controller.ordersHasMore;
            if (isLoading && orders.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else if (orders.isEmpty) {
              return Center(child: 'لا يوجد طلبات'.bodyMedium());
            } else {
              return ListView.separated(
                primary: false,
                controller: controller.scrollController,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 8),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  if (index < orders.length) {
                    return DetailCard(
                      id: "#${orders[index].id}",
                      leadingTitle: "${orders[index].status!.name}",
                      leadingColor: orders[index].statusId == 3
                          ? Constants.pending
                          : orders[index].statusId == 1
                              ? Constants.success
                              : orders[index].statusId == 2
                                  ? Constants.cancel
                                  : Constants.primary,
                      subtitles: [
                        "الزيون:".bodyMedium(),
                        const SizedBox(height: 5),
                        "عدد المنتجات:".bodyMedium(),
                        const SizedBox(height: 5),
                        "اجمالي قيمة المنتجات:".bodyMedium(),
                        const SizedBox(height: 5),
                        "تاريخ الطلب:".bodyMedium(),
                        const SizedBox(height: 5),
                        "العنوان:".bodyMedium(),
                      ],
                      subValues: [
                        "${controller.customerData.value.customer?.name}"
                            .subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        "${orders[index].qty}".subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        "${orders[index].totalPrice}"
                            .subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        "${orders[index].createDate}"
                            .subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        "${orders[index].addressDetailes}"
                            .subtitle(color: Colors.black),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
                itemCount: orders.length + (hasMore ? 1 : 0),
              );
            }
          }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const Fab(),
    );
  }
}
