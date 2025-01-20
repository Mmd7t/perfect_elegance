import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/enums/enums.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/global_textfield.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/tickets/controllers/tickets_controller.dart';

class AddTicketView extends GetView<TicketsController> {
  const AddTicketView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "إنشاء تذكرة"),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              GlobalTextField(
                hintText: "عنوان التذكرة",
                title: "عنوان التذكرة",
                inputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "يجب ادخال عنوان التذكرة";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => controller.title.value = val!,
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  'الأولوية'.tr.subtitle(),
                  const SizedBox(height: 8),
                  Obx(
                    () {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Constants.grey3, width: 1),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<TicketPriority>(
                            padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 15)
                                .copyWith(end: 25),
                            isExpanded: true,
                            value: controller.priority.value,
                            borderRadius: BorderRadius.circular(15),
                            elevation: 2,
                            hint: 'أختر الأولوية'.bodyMedium(),
                            alignment: AlignmentDirectional.centerStart,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                            },
                            items: [
                              DropdownMenuItem(
                                alignment: AlignmentDirectional.centerStart,
                                value: TicketPriority.low,
                                child: 'منخفض'.bodyMedium(color: Colors.black),
                              ),
                              DropdownMenuItem(
                                alignment: AlignmentDirectional.centerStart,
                                value: TicketPriority.medium,
                                child: 'متوسط'.bodyMedium(color: Colors.black),
                              ),
                              DropdownMenuItem(
                                alignment: AlignmentDirectional.centerStart,
                                value: TicketPriority.high,
                                child: 'مرتفع'.bodyMedium(color: Colors.black),
                              ),
                            ],
                            onChanged: (value) {
                              controller.priority.value = value!;
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              GlobalTextField(
                hintText: "اختر",
                title: "الادارة",
                inputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "يجب ادخال عنوان التذكرة";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => controller.title.value = val!,
              ),
              const SizedBox(height: 8),
              GlobalTextField(
                hintText: "123456",
                title: "كود الشحن",
                inputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onSaved: (val) => controller.title.value = val!,
              ),
              const SizedBox(height: 8),
              GlobalTextField(
                hintText: "اكتب",
                title: "محتوى التذكرة",
                maxLines: 4,
                inputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "يجب ادخال محتوى التذكرة";
                  } else {
                    return null;
                  }
                },
                onSaved: (val) => controller.title.value = val!,
              ),
              const SizedBox(height: 40),
              GlobalButton(
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.formKey.currentState!.save();
                    controller.addNewTicket();
                  }
                },
                text: "إنشاء",
                width: Get.width,
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
