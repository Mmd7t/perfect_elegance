import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:perfect_elegance/app/core/widgets/detail_card.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/order_details_model/log.dart';
import 'package:perfect_elegance/app/data/models/order_details_model/product_order.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/order_details_controller.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/delete_product_button.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/edit_product_button.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class RequestDetailsView extends GetView<OrderDetailsController> {
  const RequestDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "بيانات الطلب"),
      body: Obx(
        () {
          if (controller.isOrderLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (controller.orderData.value.id == null) {
              return Center(child: "لا يوجد بيانات".bodyMedium());
            } else {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    DetailCard(
                      title: "بيانات الطلب",
                      id: "#${controller.orderData.value.id}",
                      leadingTitle: "${controller.orderData.value.status}",
                      leadingColor: controller.orderData.value.statusId == 3
                          ? Constants.pending
                          : controller.orderData.value.statusId == 1
                              ? Constants.success
                              : controller.orderData.value.statusId == 2
                                  ? Constants.cancel
                                  : Constants.primary,
                      subtitles: [
                        "اسم الزيون:".bodyMedium(),
                        const SizedBox(height: 5),
                        "رقم الهاتف:".bodyMedium(),
                        const SizedBox(height: 5),
                        "المدينة:".bodyMedium(),
                        const SizedBox(height: 5),
                        "العنوان:".bodyMedium(),
                        const SizedBox(height: 5),
                        "عدد المنتجات:".bodyMedium(),
                        const SizedBox(height: 5),
                        "اجمالي قيمة المنتجات:".bodyMedium(),
                      ],
                      subValues: [
                        "${controller.orderData.value.user!.name}"
                            .subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        Directionality(
                            textDirection: TextDirection.ltr,
                            child: "${controller.orderData.value.user!.phone}"
                                .subtitle(color: Colors.black)),
                        const SizedBox(height: 5),
                        "${controller.orderData.value.city}"
                            .subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        "${controller.orderData.value.user!.address}"
                            .subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        "${controller.orderData.value.productsCount}"
                            .subtitle(color: Colors.black),
                        const SizedBox(height: 5),
                        "${controller.orderData.value.totalPrice} د.ل"
                            .subtitle(color: Colors.black),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "منتجات الطلب".titleSmall(),
                        const SizedBox(height: 15),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            ProductOrder product =
                                controller.orderData.value.productOrders[index];
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    "#${product.id}".body(
                                        weight: FontWeight.bold,
                                        color: Colors.black),
                                    if (controller.orderData.value.statusId ==
                                            1 ||
                                        controller.orderData.value.statusId ==
                                            3) ...{
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(width: 3),
                                          EditProductButton(product: product),
                                          const SizedBox(width: 3),
                                          DeleteProductButton(
                                              productId: product.id!),
                                        ],
                                      ),
                                    },
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  width: Get.width,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Constants.primary
                                        .withValues(alpha: 0.08),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: "SKU: ${product.sku}".caption(
                                    color: Constants.primary,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          "اسم المنتج:".bodyMedium(),
                                          const SizedBox(height: 5),
                                          "المقاس:".bodyMedium(),
                                          const SizedBox(height: 5),
                                          "اللون:".bodyMedium(),
                                          const SizedBox(height: 5),
                                          "سعر الشراء:".bodyMedium(),
                                          const SizedBox(height: 5),
                                          "سعر البيع بالدينار الليبي:"
                                              .bodyMedium(),
                                          const SizedBox(height: 5),
                                          "رابط الشراء:".bodyMedium(),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          "${product.name}"
                                              .subtitle(color: Colors.black),
                                          const SizedBox(height: 5),
                                          "${product.size}"
                                              .subtitle(color: Colors.black),
                                          const SizedBox(height: 5),
                                          (product.colorName ?? "")
                                              .subtitle(color: Colors.black),
                                          const SizedBox(height: 5),
                                          "${product.dollarPurchasingPrice} USD"
                                              .subtitle(color: Colors.black),
                                          const SizedBox(height: 5),
                                          "${product.dinarSellingPrice} د.ل"
                                              .subtitle(color: Colors.black),
                                          const SizedBox(height: 5),
                                          InkWell(
                                            onTap: () {
                                              launch(Uri.parse(
                                                  product.purchasesLink ?? ""));
                                            },
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: "eye".iconColored(
                                                  color: Constants.primary),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                            height: 40,
                            color: Constants.grey3,
                          ),
                          itemCount:
                              controller.orderData.value.productOrders.length,
                        ),
                      ],
                    ).decorate(padding: 15),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "سجل الطلب".titleSmall(),
                        const SizedBox(height: 15),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Log log = controller.orderData.value.logs[index];
                            return Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Constants.grey4),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "#${log.id}".titleSmall(
                                    weight: FontWeight.bold,
                                  ),
                                  const SizedBox(height: 5),
                                  "${log.details}".subtitle(
                                    weight: FontWeight.bold,
                                  ),
                                  const SizedBox(height: 5),
                                  Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: DateFormat("dd-MM-yyyy hh:mm a")
                                        .format(log.createdAt!)
                                        .bodyMedium(),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          itemCount: controller.orderData.value.logs.length,
                        ),
                      ],
                    ).decorate(padding: 15),
                    const SizedBox(height: 100),
                  ],
                ),
              );
            }
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(() {
        if (controller.isOrderLoading.value) {
          return const SizedBox();
        } else {
          if (controller.orderData.value.statusId == null) {
            return const SizedBox();
          } else {
            if (controller.orderData.value.statusId == 3 ||
                controller.orderData.value.statusId == 1) {
              return FloatingActionButton.extended(
                onPressed: () {
                  Get.toNamed(Routes.addProductsRequest);
                },
                extendedPadding: const EdgeInsets.symmetric(horizontal: 30),
                backgroundColor: Constants.primary,
                label: "اضافة منتجات".button(color: Colors.white),
              );
            } else {
              return const SizedBox();
            }
          }
        }
      }),
    );
  }
}
