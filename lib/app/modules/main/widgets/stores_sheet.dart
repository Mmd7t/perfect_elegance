import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/custom_textfield.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/main/controllers/main_controller.dart';

class StoresSheet extends GetWidget<MainController> {
  const StoresSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 400,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: CustomTextField(
                  prefixIcon: 'search',
                  hintText: "بحث ...",
                  onChanged: (value) {
                    controller.filterItems(value!);
                  },
                ),
              ),
            ),
            Expanded(
              child: controller.filteredStores.isEmpty
                  ? Center(
                      child: "لا يوجد نتائج".bodyMedium(),
                    )
                  : CupertinoPicker(
                      itemExtent: 35,
                      scrollController: FixedExtentScrollController(
                        initialItem: controller.selectedIndex.value,
                      ),
                      onSelectedItemChanged: (int index) {
                        controller.selectedIndex.value = controller.stores
                            .indexOf(controller.filteredStores[index]);
                      },
                      magnification: 1.2,
                      children: controller.filteredStores
                          .map((item) => Center(
                                child: item.name!.subtitle(),
                              ))
                          .toList(),
                    ),
            ),
            SafeArea(
              child: CupertinoButton(
                child: const Text("Done"),
                onPressed: () {
                  Get.back();
                  controller.appServices.setIsVerified(controller
                          .stores[controller.selectedIndex.value].isVerified ??
                      false);
                  controller.appServices.setStoreName(
                      controller.stores[controller.selectedIndex.value].name ??
                          "");
                  controller.selectStore(
                      controller.stores[controller.selectedIndex.value].id!);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
