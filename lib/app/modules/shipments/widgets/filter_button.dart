import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/packages_model/datum.dart';
import 'package:perfect_elegance/app/modules/shipments/controllers/shipments_controller.dart';

class FilterButton extends GetWidget<ShipmentsController> {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 0,
          child: ListTile(
            title: "الكل".bodyMedium(color: Constants.grey2),
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: ListTile(
            title: "جديدة".bodyMedium(color: Constants.grey2),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: ListTile(
            title: "ملغية".bodyMedium(color: Constants.grey2),
          ),
        ),
        PopupMenuItem(
          value: 6,
          child: ListTile(
            title: "مكتملة".bodyMedium(color: Constants.grey2),
          ),
        ),
        PopupMenuItem(
          value: 11,
          child: ListTile(
            title: "قيد التوصيل".bodyMedium(color: Constants.grey2),
          ),
        ),
        PopupMenuItem(
          value: 12,
          child: ListTile(
            title: "قيد الانتظار".bodyMedium(color: Constants.grey2),
          ),
        ),
        PopupMenuItem(
          value: 13,
          child: ListTile(
            title: "قيد التسوية المالية".bodyMedium(color: Constants.grey2),
          ),
        ),
        PopupMenuItem(
          value: 17,
          child: ListTile(
            title: "قيد التجهيز".bodyMedium(color: Constants.grey2),
          ),
        ),
        PopupMenuItem(
          value: 21,
          child: ListTile(
            title: "مستردة".bodyMedium(color: Constants.grey2),
          ),
        ),
      ],
      splashRadius: 18,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 6,
      onSelected: (value) {
        controller.orders.value = <PackageDatum>[];
        controller.packagesCurrentPage.value = 1;
        controller.packagesLastPage.value = 1;
        controller.getAllPackages(status: value == 0 ? "" : value.toString());
      },
      shadowColor: Constants.grey4.withValues(alpha: 0.5),
      position: PopupMenuPosition.under,
      constraints: const BoxConstraints(
        minWidth: 180,
      ),
      child: Container(
        height: 45,
        width: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Get.theme.primaryColor,
          shape: BoxShape.circle,
        ),
        child: "candle".iconColored(size: 20),
      ),
    );
  }
}
