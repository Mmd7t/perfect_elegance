import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/custom_textfield.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/add_order_controller.dart';
import 'package:perfect_elegance/app/modules/requests/widgets/product_dropdown.dart';

class AddProductSection extends GetWidget<AddOrderController> {
  const AddProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 15),
          child: "بيانات الطلبية".titleSmall(),
        ),
        const SizedBox(height: 10),
        Obx(() {
          if (controller.isProductLoading.value) {
            return const CircularProgressIndicator();
          } else if (controller.procducts.value.products.isEmpty) {
            return "لا يوجد منتجات".bodyMedium();
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ProductDropdown(
                hint: "اختر منتج",
                data: controller.procducts.value.products,
                onChanged: (value) {
                  if (value != null) {
                    if (!controller.chosenProducts.contains(value)) {
                      controller.chosenProducts.add(value);
                    } else {
                      Fluttertoast.showToast(msg: "عذرا..المنتج موجود بالفعل");
                    }
                  }
                },
              ),
            );
          }
        }),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(() {
            if (controller.chosenProducts.isNotEmpty) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: DataTable(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    headingRowColor:
                        const WidgetStatePropertyAll(Constants.primary),
                    border: TableBorder.all(
                        borderRadius: BorderRadius.circular(10),
                        color: Constants.primary),
                    columns: [
                      DataColumn(
                          label: 'SKU'.titleSmall(color: Constants.grey5)),
                      DataColumn(
                          label:
                              'اسم المنتج'.titleSmall(color: Constants.grey5)),
                      DataColumn(
                          label:
                              'سعر المنتج'.titleSmall(color: Constants.grey5)),
                      DataColumn(label: ''.titleSmall()),
                    ],
                    rows: List.generate(
                      controller.chosenProducts.length,
                      (index) {
                        return DataRow(
                          cells: [
                            DataCell(
                              (controller.chosenProducts[index].product!.sku ??
                                      "")
                                  .bodyMedium(color: Constants.black3),
                            ),
                            DataCell((controller
                                        .chosenProducts[index].product!.name ??
                                    "")
                                .bodyMedium(color: Constants.black3)),
                            DataCell(
                              CustomTextField(
                                value: controller
                                    .chosenProducts[index].dollarPurchasingPrice
                                    .toString(),
                                hintText: "",
                                onChanged: (value) {
                                  Get.log(value!);
                                  controller.chosenProducts[index]
                                          .dollarPurchasingPrice =
                                      double.parse(value);
                                },
                              ),
                              // controller.chosenProducts[index]
                              //           .dollarPurchasingPrice !=
                              //       null
                              //   ? "${controller.chosenProducts[index].dollarPurchasingPrice!}"
                              //       .bodyMedium(color: Constants.black3)
                              //   : "".body()
                            ),
                            DataCell(
                              IconButton(
                                icon: "delete"
                                    .iconColored(color: Constants.cancel),
                                onPressed: () {
                                  controller.chosenProducts.removeAt(index);
                                },
                              ),
                            )
                          ],
                        );
                      },
                    )),
              );
            } else {
              return const SizedBox();
            }
          }),
        )
      ],
    ).decorate();
  }
}
