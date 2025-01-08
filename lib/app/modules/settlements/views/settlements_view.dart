import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

import '../controllers/settlements_controller.dart';

class SettlementsView extends GetView<SettlementsController> {
  const SettlementsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'التسوية'.title(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: SearchCard(
                      text: "بحث..",
                      icon: "search",
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Get.theme.primaryColor,
                    ),
                    onPressed: () {},
                    icon: "candle".iconColored(size: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemBuilder: (context, index) => InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "6010".titleSmall(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 4),
                      decoration: BoxDecoration(
                        color: Constants.primary.withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: "24-12-2024".caption(color: Constants.primary),
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
                          "1000".subtitle(),
                          const SizedBox(height: 6),
                          "500".subtitle(),
                          const SizedBox(height: 6),
                          "1000".subtitle(),
                          const SizedBox(height: 6),
                          "1000".subtitle(),
                          const SizedBox(height: 6),
                          "100".subtitle(),
                          const SizedBox(height: 6),
                          "300".subtitle(),
                          const SizedBox(height: 6),
                          "220".subtitle(),
                          const SizedBox(height: 6),
                          "8000".subtitle(color: Get.theme.primaryColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ).decorate(padding: 12),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
