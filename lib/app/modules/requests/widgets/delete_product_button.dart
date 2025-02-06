import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/order_details_controller.dart';

class DeleteProductButton extends GetWidget<OrderDetailsController> {
  final int productId;
  const DeleteProductButton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Constants.cancel.withValues(alpha: 0.1),
        highlightColor: Constants.cancel.withValues(alpha: 0.2),
      ),
      onPressed: () {
        Get.defaultDialog(
          title: "ازالة المنتج",
          titleStyle: Get.textTheme.titleMedium!.copyWith(
            color: Constants.primary,
            fontFamily: "Cairo",
          ),
          cancel: TextButton(
            onPressed: () {
              Get.back();
            },
            style: TextButton.styleFrom(
              backgroundColor: Constants.grey4.withValues(alpha: 0.2),
            ),
            child: "الغاء".button(color: Constants.cancel),
          ),
          confirm: TextButton(
            onPressed: () {
              controller.deleteProduct(productId);
            },
            style: TextButton.styleFrom(
              backgroundColor: Constants.primary,
            ),
            child: "ازالة".button(color: Colors.white),
          ),
          content: "هل تريد بالفعل حذف هذا المنتج؟".bodyMedium(),
        );
      },
      icon: "delete".iconColored(color: Constants.cancel),
    );
  }
}
