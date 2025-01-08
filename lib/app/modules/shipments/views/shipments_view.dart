import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/search_card.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

import '../controllers/shipments_controller.dart';

class ShipmentsView extends GetView<ShipmentsController> {
  const ShipmentsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'الشحنات'.title(),
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
        body: GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 16 / 15,
          ),
          itemBuilder: (context, index) => InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => Get.toNamed(Routes.shipmentDetails),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "#1001".titleSmall(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE4CB87).withValues(alpha: 0.16),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: "قائمة".caption(color: Constants.pending),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    "user".iconColored(size: 16),
                    const SizedBox(width: 8),
                    "هند أسامة".bodyMedium(),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    "phone".iconColored(size: 16),
                    const SizedBox(width: 8),
                    "+20 1022 2322 22".bodyMedium(),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    "location".iconColored(size: 16),
                    const SizedBox(width: 8),
                    "طرابلس".bodyMedium(),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    "package".iconColored(size: 16),
                    const SizedBox(width: 8),
                    "4".bodyMedium(),
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
