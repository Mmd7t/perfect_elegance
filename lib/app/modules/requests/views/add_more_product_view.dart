import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/order_details_controller.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/product_card.dart';

class AddMoreProductView extends GetView<OrderDetailsController> {
  const AddMoreProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "اضافة منتجات للطلب"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: SearchCard(
                          controller:
                              controller.addOrderController.skuController,
                          tag: 'sku search',
                          text: "البحث عن منتج - sku",
                          icon: "search",
                        ),
                      ),
                      const SizedBox(width: 5),
                      GlobalButton(
                        onTap: () {
                          controller.addOrderController.searchForProduct();
                        },
                        text: "بحث",
                        height: 40,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Obx(() {
                  if (controller.addOrderController.isProductLoading.value) {
                    return const Center(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ));
                  } else {
                    if (controller.addOrderController.products.isEmpty) {
                      return const SizedBox();
                    } else {
                      return AspectRatio(
                        aspectRatio: 15 / 18,
                        child: PageView.builder(
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ProductCard(
                                product: controller
                                    .addOrderController.products[index]),
                          ),
                          itemCount:
                              controller.addOrderController.products.length,
                        ),
                      );
                    }
                  }
                }),
              ],
            ).decorate(),
          ],
        ),
      ),
      bottomSheet: Obx(() {
        if (controller.addOrderController.products.isEmpty) {
          return const SizedBox();
        } else {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 25),
            child: GlobalButton(
              onTap: () {
                controller.insertProduct();
              },
              text: "اضافة",
              width: Get.width,
            ),
          );
        }
      }),
    );
  }
}
