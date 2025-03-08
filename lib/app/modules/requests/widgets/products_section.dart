import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/add_order_controller.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/product_table.dart';

class ProductsSection extends GetWidget<AddOrderController> {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 15),
          child: "بيانات الطلبية".titleSmall(),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: SearchCard(
                  controller: controller.skuController,
                  tag: 'sku search',
                  text: "البحث عن منتج - sku",
                  icon: "search",
                ),
              ),
              const SizedBox(width: 5),
              GlobalButton(
                onTap: () {
                  controller.searchForProduct();
                },
                text: "بحث",
                height: 40,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Obx(() {
          if (controller.isProductLoading.value) {
            return const Center(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ));
          } else {
            if (controller.products.isEmpty) {
              return const SizedBox();
            } else {
              return const ProductTable();
            }
          }
        }),
      ],
    ).decorate();
  }
}
