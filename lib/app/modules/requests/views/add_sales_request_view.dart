import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/add_order_controller.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/add_product_section.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/customer_section.dart';

class AddSalesRequestView extends GetView<AddOrderController> {
  const AddSalesRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "إنشاء طلبية التسليم الفوري"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: controller.addOrderFormKey,
          child: const Column(
            children: [
              CustomerSection(),
              SizedBox(height: 10),
              AddProductSection()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16)
            .copyWith(bottom: 5, top: 8),
        child: SafeArea(
          child: GlobalButton(
            onTap: () {
              if (controller.addOrderFormKey.currentState!.validate()) {
                controller.addOrderFormKey.currentState!.save();
                if (controller.customer.value.id == null) {
                  Ui.errorGetBar(message: "الرجاء اختيار عميل");
                } else if (controller.chosenProducts.isEmpty) {
                  Ui.errorGetBar(message: "الرجاء اضافة منتج");
                } else {
                  controller.addSalesStore();
                }
              }
            },
            text: "إضافة",
          ),
        ),
      ),
    );
  }
}
