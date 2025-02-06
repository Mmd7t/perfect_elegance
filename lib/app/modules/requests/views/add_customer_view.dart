import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/custom_search_dropdown.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/global_textfield.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/add_order_controller.dart';

class AddCustomerView extends GetView<AddOrderController> {
  const AddCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "اضافة زبون"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.customerFormKey,
          child: Column(
            children: [
              GlobalTextField(
                hintText: "ادخل",
                title: "اسم الزبون",
                filled: true,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "من فضلك ادخل اسم الزبون";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => controller.name.value = val!,
              ),
              const SizedBox(height: 8),
              GlobalTextField(
                hintText: "ادخل",
                title: "رقم الهاتف",
                filled: true,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "من فضلك ادخل رقم الهاتف";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => controller.phone1.value = val!,
              ),
              const SizedBox(height: 8),
              GlobalTextField(
                hintText: "ادخل",
                title: "رقم الهاتف الاحتياطي",
                filled: true,
                onSaved: (val) => controller.phone2.value = val!,
              ),
              const SizedBox(height: 8),
              GlobalTextField(
                hintText: "ادخل",
                title: "البريد الالكتروني",
                filled: true,
                onSaved: (val) => controller.email.value = val!,
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: Get.width,
                child: 'المدينة'.tr.subtitle(),
              ),
              const SizedBox(height: 8),
              CustomSearchDropdown(
                data: controller.cities.map((e) => e.name!).toList(),
                hint: "ادخل",
                selectedItem: controller.cityName.value,
                onChanged: (p0) {
                  controller.cityName.value = p0!;
                  controller.cityId.value = controller.cities
                      .where((e) => p0 == e.name)
                      .first
                      .id!
                      .toString();
                },
              ),
              const SizedBox(height: 8),
              GlobalTextField(
                hintText: "ادخل",
                title: "العنوان التفصيلي",
                filled: true,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "من فضلك ادخل العنوان التفصيلي";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => controller.address.value = val!,
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: GlobalButton(
                      onTap: () {
                        if (controller.customerFormKey.currentState!
                            .validate()) {
                          controller.customerFormKey.currentState!.save();
                          controller.addCustomer();
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
