import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/customers/controllers/customer_details_controller.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class Fab extends GetView<CustomerDetailsController> {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isCustomerLoading.value) {
        return const SizedBox();
      } else {
        if (controller.customerData.value.customer == null) {
          return const SizedBox();
        } else {
          return FloatingActionButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Get.back();
                        controller.nameController.text =
                            controller.customerData.value.customer!.name ?? "";
                        controller.emailController.text =
                            controller.customerData.value.customer!.email ?? "";
                        controller.phoneController.text =
                            controller.customerData.value.customer!.phone ?? "";
                        controller.phone2Controller.text =
                            controller.customerData.value.customer!.phone2 ??
                                "";
                        controller.addressController.text =
                            controller.customerData.value.customer!.address ??
                                "";
                        controller.cityId.value = controller
                            .customerData.value.customer!.cityId
                            .toString();
                        controller.cityName.value = controller
                            .customerData.value.customer!.cityName
                            .toString();
                        Get.toNamed(Routes.editCustomer);
                      },
                      child: "تعديل بيانات الزبون".button(),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        Get.back();
                        Get.defaultDialog(
                          title:
                              (controller.customerData.value.customer!.active ==
                                      1)
                                  ? "حظر الزبون"
                                  : "الغاء حظر الزبون",
                          titleStyle: Get.textTheme.titleMedium!.copyWith(
                            color: Constants.primary,
                            fontFamily: "Cairo",
                          ),
                          cancel: TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Constants.grey4.withValues(alpha: 0.2),
                            ),
                            child: "الغاء".button(color: Constants.cancel),
                          ),
                          confirm: TextButton(
                            onPressed: () {
                              Get.back();
                              controller.banCustomer(
                                  controller.customerData.value.customer!.id!);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Constants.primary,
                            ),
                            child: (controller.customerData.value.customer!
                                            .active ==
                                        1
                                    ? "حظر"
                                    : "الغاء الحظر")
                                .button(color: Colors.white),
                          ),
                          content:
                              (controller.customerData.value.customer!.active ==
                                          1
                                      ? "هل تريد تأكيد حظر الزبون؟"
                                      : "هل تريد الغاء حظر الزبون؟")
                                  .bodyMedium(),
                        );
                      },
                      child: (controller.customerData.value.customer!.active ==
                              1)
                          ? "حظر الزبون".button(color: Constants.cancel)
                          : "الغاء حظر الزبون".button(color: Constants.success),
                    ),
                  ],
                ),
              );
            },
            backgroundColor: Constants.primary,
            shape: const CircleBorder(),
            child: "edit".iconColored(color: Colors.white),
          );
        }
      }
    });
  }
}
