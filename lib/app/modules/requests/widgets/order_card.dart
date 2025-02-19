import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/all_orders_model/datum.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/requests_controller.dart';

class OrderCard extends GetWidget<RequestsController> {
  final OrderDatum order;
  final bool isPackage;
  const OrderCard({super.key, required this.order, this.isPackage = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (isPackage)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: "#${order.id}".titleSmall(),
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 4),
                      decoration: BoxDecoration(
                        color: (order.status == "قيد الإنتظار"
                                ? Constants.pending
                                : order.status == "جديدة"
                                    ? Constants.success
                                    : order.status == "ملغية"
                                        ? Constants.cancel
                                        : Constants.primary)
                            .withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: "${order.status}".caption(
                          weight: FontWeight.bold,
                          color: order.status == "قيد الإنتظار"
                              ? Constants.pending
                              : order.status == "جديدة"
                                  ? Constants.success
                                  : order.status == "ملغية"
                                      ? Constants.cancel
                                      : Constants.primary),
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: "#${order.id}".titleSmall()),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    decoration: BoxDecoration(
                      color: (order.status == "قائمة"
                              ? Constants.pending
                              : order.status == "جديدة"
                                  ? Constants.success
                                  : order.status == "ملغية"
                                      ? Constants.cancel
                                      : Constants.primary)
                          .withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: "${order.status}".caption(
                        weight: FontWeight.bold,
                        color: order.status == "قائمة"
                            ? Constants.pending
                            : order.status == "جديدة"
                                ? Constants.success
                                : order.status == "ملغية"
                                    ? Constants.cancel
                                    : Constants.primary),
                  ),
                ],
              ),
        const Spacer(),
        Row(
          children: [
            "user".iconColored(size: 16),
            const SizedBox(width: 8),
            Expanded(child: "${order.customer!.name}".bodyMedium()),
          ],
        ),
        const SizedBox(height: 7),
        Row(
          children: [
            "phone".iconColored(size: 16),
            const SizedBox(width: 8),
            Expanded(child: "${order.customer!.phone}".bodyMedium()),
          ],
        ),
        const SizedBox(height: 7),
        Row(
          children: [
            "location".iconColored(size: 16),
            const SizedBox(width: 8),
            Expanded(child: "${order.customer!.address}".caption()),
          ],
        ),
        const SizedBox(height: 7),
        Row(
          children: [
            "package".iconColored(size: 16),
            const SizedBox(width: 8),
            Expanded(child: "${order.productsCount}".bodyMedium()),
          ],
        ),
      ],
    ).decorate(padding: 12);
  }
}
