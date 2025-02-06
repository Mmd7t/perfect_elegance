import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/add_order_controller.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/product_card.dart';

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
              return Column(
                children: [
                  AspectRatio(
                    aspectRatio: 15 / 17.5,
                    child: PageView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ProductCard(product: controller.products[index]),
                      ),
                      itemCount: controller.products.length,
                      onPageChanged: (value) {
                        controller.currentProductIndex.value = value;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.products.length,
                      (index) => AnimatedContainer(
                        margin: const EdgeInsets.all(3),
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut,
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentProductIndex.value == index
                              ? Constants.primary
                              : Constants.grey4,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              );
            }
          }
        }),
      ],
    ).decorate();
  }
}
