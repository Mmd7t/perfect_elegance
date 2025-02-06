import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/main/controllers/stores_controller.dart';

class StoresView extends GetView<StoresController> {
  const StoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: "أختر متجر".title(),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isStoresLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (controller.stores.isEmpty) {
            return Center(child: "لا يوجد متاجر".bodyMedium());
          } else {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  controller.appServices.setIsVerified(
                      controller.stores[index].isVerified ?? false);
                  controller.appServices
                      .setStoreName(controller.stores[index].name ?? "");
                  controller.selectStore(controller.stores[index].id!);
                },
                title: "${controller.stores[index].name}".titleSmall(),
                trailing: const Icon(
                  Icons.arrow_right_alt_outlined,
                  color: Constants.primary,
                ),
              ).decorate(),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: controller.stores.length,
            );
          }
        }
      }),
    );
  }
}
