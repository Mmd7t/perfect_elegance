import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/detail_card.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/package_details_model/product_order.dart';
import 'package:perfect_elegance/app/modules/shipments/controllers/shipment_details_controller.dart';

class ShipmentDetailsView extends GetView<ShipmentDetailsController> {
  const ShipmentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "بيانات الشحنة"),
      body: Obx(() {
        if (controller.isPackagesLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (controller.packageData.value.customer == null) {
            return Center(child: "لا يوجد بيانات".bodyMedium());
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  DetailCard(
                    title: "رقم الشحنة",
                    id: "#${controller.packageData.value.id}",
                    leadingTitle: "${controller.packageData.value.status}",
                    leadingColor: Constants.pending,
                    subtitles: [
                      "اسم الزيون:".bodyMedium(),
                      const SizedBox(height: 5),
                      "رقم الهاتف:".bodyMedium(),
                      const SizedBox(height: 5),
                      "المدينة:".bodyMedium(),
                      const SizedBox(height: 5),
                      "العنوان:".bodyMedium(),
                    ],
                    subValues: [
                      "${controller.packageData.value.customer!.name}"
                          .subtitle(color: Colors.black),
                      const SizedBox(height: 5),
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child:
                              "${controller.packageData.value.customer!.phone}"
                                  .subtitle(color: Colors.black)),
                      const SizedBox(height: 5),
                      "${controller.packageData.value.customer!.address}"
                          .subtitle(color: Colors.black),
                      const SizedBox(height: 5),
                      "${controller.packageData.value.customer!.address}"
                          .subtitle(color: Colors.black),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ExpansionTile(
                    childrenPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: "عرض بيانات شركة الشحن"
                        .subtitle(color: Get.theme.primaryColor),
                    children: [
                      DetailCard(
                        title: "رقم الطلبية",
                        id: "${controller.packageData.value.vanexPackage!.data!.packageCode}",
                        leadingTitle:
                            "${controller.packageData.value.vanexPackage!.data!.packageType!.name}",
                        leadingColor: Constants.primary,
                        subtitles: [
                          "المندوب:".bodyMedium(),
                          const SizedBox(height: 5),
                          "الكمية:".bodyMedium(),
                          const SizedBox(height: 5),
                          "سعر المنتجات:".bodyMedium(),
                          const SizedBox(height: 5),
                          "سعر التوصيل:".bodyMedium(),
                          const SizedBox(height: 5),
                          "الاجمالي:".bodyMedium(),
                          const SizedBox(height: 5),
                          "طريقة الدفع:".bodyMedium(),
                        ],
                        subValues: [
                          "فانكس".subtitle(color: Colors.black),
                          const SizedBox(height: 5),
                          "${controller.packageData.value.vanexPackage!.data!.qty}"
                              .subtitle(color: Colors.black),
                          const SizedBox(height: 5),
                          "${controller.packageData.value.vanexPackage!.data!.originPrice} د.ل"
                              .subtitle(color: Colors.black),
                          const SizedBox(height: 5),
                          "${controller.packageData.value.vanexPackage!.data!.shippment} د.ل"
                              .subtitle(color: Colors.black),
                          const SizedBox(height: 5),
                          "${controller.packageData.value.vanexPackage!.data!.total} د.ل"
                              .subtitle(color: Colors.black),
                          const SizedBox(height: 5),
                          "${controller.packageData.value.vanexPackage!.data!.paymentMethode}"
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
                              ProductOrder product = controller
                                  .packageData.value.productOrders[index];
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      "#${product.id}".body(
                                          weight: FontWeight.bold,
                                          color: Colors.black),
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
                                            "${product.dollarPurchasingPrice} USD"
                                                .subtitle(color: Colors.black),
                                            const SizedBox(height: 5),
                                            "${product.dinarSellingPrice} د.ل"
                                                .subtitle(color: Colors.black),
                                            const SizedBox(height: 5),
                                            InkWell(
                                              onTap: () {
                                                launch(Uri.parse(
                                                    product.purchasesLink ??
                                                        ""));
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
                            itemCount: controller
                                .packageData.value.productOrders.length,
                          ),
                        ],
                      ).decorate(padding: 15),
                      const SizedBox(height: 10),
                    ],
                  ).decorate(),
                ],
              ),
            );
          }
        }
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Obx(() {
        if (controller.isPackagesLoading.value) {
          return const SizedBox();
        } else {
          if (controller.packageData.value.status != null) {
            if (controller.packageData.value.status == "قيد الإنتظار") {
              return FloatingActionButton.extended(
                onPressed: () {
                  controller.restorePackage(controller.packageData.value.id!);
                },
                extendedPadding: const EdgeInsets.symmetric(horizontal: 30),
                label: "استرجاع".button(color: Colors.white),
                backgroundColor: Constants.cancel,
              );
            } else {
              return const SizedBox();
            }
          } else {
            return const SizedBox();
          }
        }
      }),
    );
  }
}
