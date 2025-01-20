import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/settlements_model/settlement.dart';

class SettlementCard extends StatelessWidget {
  final Settlement settlement;
  const SettlementCard({super.key, required this.settlement});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "${settlement.settlementCode}".titleSmall(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              decoration: BoxDecoration(
                color: Constants.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(5),
              ),
              child:
                  "${settlement.createdAt}".caption(color: Constants.primary),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "قيمة التسوية الكلية:".bodyMedium(),
                  const SizedBox(height: 6),
                  "اجمالي المبيعات بالدينار:".bodyMedium(),
                  const SizedBox(height: 6),
                  "اجمالي سعر المشتريات بالدولار:".bodyMedium(),
                  const SizedBox(height: 6),
                  "اجمالي سعر المشتريات بالدينار:".bodyMedium(),
                  const SizedBox(height: 6),
                  "قيمة الشحن الخارجي:".bodyMedium(),
                  const SizedBox(height: 6),
                  "قيمة الإعلانات الممولة:".bodyMedium(),
                  const SizedBox(height: 6),
                  "قيمة تجهيز الشحنات:".bodyMedium(),
                  const SizedBox(height: 6),
                  "صافي مربح المتجر:".bodyMedium(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "${settlement.totalSettlementAmount}".subtitle(),
                  const SizedBox(height: 6),
                  "${settlement.totalDinarSellingPrice}".subtitle(),
                  const SizedBox(height: 6),
                  "${settlement.totalDollarPurchasingPrice}".subtitle(),
                  const SizedBox(height: 6),
                  "${settlement.totalDinarPurchasingPrice}".subtitle(),
                  const SizedBox(height: 6),
                  "${settlement.totalExternalWeight}".subtitle(),
                  const SizedBox(height: 6),
                  "${settlement.advertisingCost}".subtitle(),
                  const SizedBox(height: 6),
                  "${settlement.totalPackagePreparationCost}".subtitle(),
                  const SizedBox(height: 6),
                  "${settlement.netStoreReceivable}"
                      .subtitle(color: Get.theme.primaryColor),
                ],
              ),
            ),
          ],
        ),
      ],
    ).decorate(padding: 12);
  }
}
