import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/add_order_controller.dart';

class CustomerSection extends GetWidget<AddOrderController> {
  const CustomerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "بيانات الزبون".titleSmall(),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: SearchCard(
                controller: controller.phoneController,
                text: "رقم الهاتف",
                icon: "search",
              ),
            ),
            const SizedBox(width: 5),
            GlobalButton(
              onTap: () {
                controller.searchForCustomer();
              },
              text: "بحث",
              height: 40,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Obx(() {
          if (controller.isCustomerLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (controller.customer.value.id == null) {
              return const SizedBox();
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "النتائج".subtitle(weight: FontWeight.w700),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "اسم الزيون:".bodyMedium(),
                            const SizedBox(height: 5),
                            "رقم الهاتف:".bodyMedium(),
                            const SizedBox(height: 5),
                            "المدينة:".bodyMedium(),
                            const SizedBox(height: 5),
                            "العنوان:".bodyMedium(),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "${controller.customer.value.name}"
                                .subtitle(color: Colors.black),
                            const SizedBox(height: 5),
                            Directionality(
                                textDirection: TextDirection.ltr,
                                child: "${controller.customer.value.phone}"
                                    .subtitle(color: Colors.black)),
                            const SizedBox(height: 5),
                            "${controller.customer.value.cityName}"
                                .subtitle(color: Colors.black),
                            const SizedBox(height: 5),
                            "${controller.customer.value.address}"
                                .subtitle(color: Colors.black),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          }
        }),
      ],
    ).decorate(padding: 15);
  }
}
