import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/detail_card.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/shipments/controllers/shipment_details_controller.dart';
import 'package:perfect_elegance/app/modules/shipments/widgets/package_history.dart';

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
                      DetailCard(
                        title: "بيانات المتجر",
                        id: "144",
                        leadingTitle: "قيد الإنتظار",
                        leadingColor: Constants.pending,
                        subtitles: [
                          "تاريخ الانشاء::".bodyMedium(),
                          const SizedBox(height: 5),
                          "الاستلام:".bodyMedium(),
                        ],
                        subValues: [
                          "24-12-2024".subtitle(color: Colors.black),
                          const SizedBox(height: 5),
                          "24-12-2024".subtitle(color: Colors.black),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const PackageHistory(),
                      const SizedBox(height: 10),
                    ],
                  ).decorate(),
                ],
              ),
            );
          }
        }
      }),
    );
  }
}
