import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/global_textfield.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/add_order_controller.dart';

class AddNewProductView extends GetView<AddOrderController> {
  const AddNewProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "اضافة منتج جديد"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.productFormKey,
          child: Column(
            children: [
              GlobalTextField(
                hintText: "ادخل",
                title: "اسم المنتج",
                filled: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "الرجاء ادخال اسم المنتج";
                  } else {
                    return null;
                  }
                },
                onSaved: (p0) => controller.productName.value = p0!,
              ),
              const SizedBox(height: 8),
              GlobalTextField(
                hintText: "ادخل",
                title: "رابط الشراء",
                filled: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "الرجاء ادخال رابط الشراء";
                  } else if (!value.isURL) {
                    return "الرجاء ادخال رابط صحيح";
                  } else {
                    return null;
                  }
                },
                onSaved: (p0) => controller.productLink.value = p0!,
              ),
              const SizedBox(height: 8),
              GlobalTextField(
                controller: controller.skuController,
                hintText: "ادخل",
                title: "وحدة حفظ المخزن (SKU)",
                filled: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "الرجاء ادخال وحدة حفظ المخزن";
                  } else {
                    return null;
                  }
                },
                onSaved: (p0) => controller.productSku.value = p0!,
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: GlobalButton(
                      onTap: () {
                        if (controller.productFormKey.currentState!
                            .validate()) {
                          controller.productFormKey.currentState!.save();
                          controller.addProduct();
                        }
                      },
                      text: "حفظ",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GlobalButton(
                      onTap: () => Get.back(),
                      text: "اغلاق",
                      color: Constants.grey5,
                      textColor: Constants.cancel,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
