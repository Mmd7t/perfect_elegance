import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/global_textfield.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/order_details_model/product_order.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/order_details_controller.dart';

class EditProductButton extends GetWidget<OrderDetailsController> {
  final ProductOrder product;
  const EditProductButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Constants.primary.withValues(alpha: 0.1),
        highlightColor: Constants.primary.withValues(alpha: 0.2),
      ),
      onPressed: () {
        controller.productSize.text = product.size ?? "";
        controller.productColor.text = product.colorName ?? "";
        controller.purchasingLink.text = product.purchasesLink ?? "";
        controller.purchasingPrice.text = product.dollarPurchasingPrice ?? "";
        controller.sellingPrice.text = product.dinarSellingPrice ?? "";
        Get.dialog(
          Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  "تعديل المنتج رقم ${product.id}#".titleSmall(),
                  const SizedBox(height: 15),
                  GlobalTextField(
                    controller: controller.purchasingLink,
                    hintText: "رابط الشراء",
                    title: "رابط الشراء",
                    filled: true,
                  ),
                  const SizedBox(height: 10),
                  GlobalTextField(
                    controller: controller.sellingPrice,
                    hintText: "سعر الشراء",
                    title: "سعر الشراء",
                    filled: true,
                  ),
                  const SizedBox(height: 10),
                  GlobalTextField(
                    controller: controller.purchasingPrice,
                    hintText: "سعر البيع بالدينار الليبي",
                    title: "سعر البيع بالدينار الليبي",
                    filled: true,
                  ),
                  const SizedBox(height: 10),
                  GlobalTextField(
                    controller: controller.productSize,
                    hintText: "المقاس",
                    title: "المقاس",
                    filled: true,
                  ),
                  const SizedBox(height: 10),
                  GlobalTextField(
                    controller: controller.productColor,
                    hintText: "اللون",
                    title: "اللون",
                    filled: true,
                  ),
                  const SizedBox(height: 15),
                  GlobalButton(
                    onTap: () {
                      controller.updateProduct(product.id!);
                    },
                    text: "تعديل",
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      icon: "edit".iconColored(color: Constants.primary),
    );
  }
}
