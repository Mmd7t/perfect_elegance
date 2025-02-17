import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/settlements/widgets/settlement_card.dart';
import 'package:perfect_elegance/app/modules/settlements/widgets/settlement_card_shimmer.dart';

import '../controllers/settlements_controller.dart';

class SettlementsView extends GetView<SettlementsController> {
  const SettlementsView({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        controller.appServices.pageController.jumpToPage(0);
        controller.appServices.currentIndex.value = 0;
      },
      child: Scaffold(
        appBar: AppBar(
          title: 'التسوية'.title(),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              controller.appServices.pageController.jumpToPage(0);
              controller.appServices.currentIndex.value = 0;
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 22),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.getSettlements();
          },
          backgroundColor: Get.theme.primaryColor,
          color: Colors.white,
          displacement: 0.0,
          child: Obx(
            () {
              if (controller.isSettlementsLoading.value) {
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemBuilder: (context, index) =>
                      const SettlementCardShimmer(),
                  itemCount: 6,
                );
              } else {
                if (controller.settlements.value.settlements.isEmpty) {
                  return Center(
                    child: "لا يوجد تسويات".bodyMedium(),
                  );
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    physics: const BouncingScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemBuilder: (context, index) => SettlementCard(
                      settlement:
                          controller.settlements.value.settlements[index],
                    ),
                    itemCount: controller.settlements.value.settlements.length,
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
