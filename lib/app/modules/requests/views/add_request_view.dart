import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/enums/enums.dart';
import 'package:perfect_elegance/app/core/theme/theme.dart';
import 'package:perfect_elegance/app/core/widgets/custom_textfield.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/global_textfield.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/add_order_controller.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/customer_section.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/products_section.dart';

class AddRequestView extends GetView<AddOrderController> {
  const AddRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "إنشاء طلبية"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: controller.addOrderFormKey,
          child: Column(
            children: [
              const CustomerSection(),
              const SizedBox(height: 10),
              const ProductsSection(),
              const SizedBox(height: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: Get.width,
                    child: "الملاحظات".titleSmall(),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: "ملاحظات",
                    maxLines: 5,
                    controller: controller.noteController,
                  ),
                ],
              ).decorate(padding: 15),
              const SizedBox(height: 10),
              Obx(() {
                return Column(
                  children: [
                    CheckboxListTile.adaptive(
                      value: controller.isDeposit.value,
                      onChanged: (value) {
                        controller.isDeposit.value = value!;
                      },
                      title: "استلام عربون".titleSmall(),
                      controlAffinity: ListTileControlAffinity.leading,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (controller.isDeposit.value) ...{
                      Column(
                        children: [
                          GlobalTextField(
                            hintText: "ادخل",
                            title: "قيمة العربون",
                            suffixText: "د.ل",
                            filled: true,
                            inputType: TextInputType.number,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "الرجاء ادخال قيمة العربون";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (val) => controller.address.value = val!,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F8F9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: controller.deliveryOn.value ==
                                        DeliveryOn.init
                                    ? null
                                    : controller.deliveryOn.value.name,
                                borderRadius: BorderRadius.circular(10),
                                hint: "على حساب"
                                    .bodyMedium(color: Constants.grey4),
                                isExpanded: true,
                                items: [
                                  DropdownMenuItem(
                                    value: "market",
                                    child: "المتجر".bodyMedium(),
                                  ),
                                  DropdownMenuItem(
                                    value: "customer",
                                    child: "الزبون".bodyMedium(),
                                  ),
                                ],
                                onChanged: (val) {
                                  if (val == "market") {
                                    controller.deliveryOn.value =
                                        DeliveryOn.market;
                                  } else {
                                    controller.deliveryOn.value =
                                        DeliveryOn.customer;
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    },
                  ],
                );
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16)
            .copyWith(bottom: 25, top: 8),
        child: GlobalButton(
          onTap: () {
            if (controller.addOrderFormKey.currentState!.validate()) {
              controller.addOrderFormKey.currentState!.save();
              if (controller.customer.value.id == null) {
                Ui.errorGetBar(message: "الرجاء اختيار عميل");
              } else if (controller.products.isEmpty) {
                Ui.errorGetBar(message: "الرجاء اضافة منتج");
              } else {
                if (controller.deliveryOn.value == DeliveryOn.init) {
                  Ui.errorGetBar(
                      message: "الرجاء قم بتحديد العربون على حساب من");
                } else {
                  controller.addStore();
                }
              }
            }
          },
          text: "اضافة",
        ),
      ),
    );
  }
}
