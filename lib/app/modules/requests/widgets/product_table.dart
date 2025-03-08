import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/custom_textfield.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/requests/controllers/add_order_controller.dart';

class ProductTable extends GetWidget<AddOrderController> {
  const ProductTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 15.0).copyWith(bottom: 15),
        child: DataTable(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          headingRowColor: const WidgetStatePropertyAll(Constants.primary),
          border: TableBorder.all(
              borderRadius: BorderRadius.circular(10),
              color: Constants.primary),
          columns: [
            DataColumn(label: 'SKU'.titleSmall(color: Constants.grey5)),
            DataColumn(label: 'اسم المنتج'.titleSmall(color: Constants.grey5)),
            DataColumn(label: 'المقاس'.titleSmall(color: Constants.grey5)),
            DataColumn(label: 'اللون'.titleSmall(color: Constants.grey5)),
            DataColumn(label: 'سعر الشراء'.titleSmall(color: Constants.grey5)),
            DataColumn(label: 'سعر البيع'.titleSmall(color: Constants.grey5)),
            DataColumn(label: 'الكمية'.titleSmall(color: Constants.grey5)),
            DataColumn(label: ''.titleSmall(color: Constants.grey5)),
          ],
          rows: List.generate(
            controller.products.length,
            (index) {
              String sku = controller.products[index].sku!;
              return DataRow(
                cells: [
                  DataCell(
                    (controller.products[index].sku ?? "")
                        .bodyMedium(color: Constants.black3),
                  ),
                  DataCell((controller.products[index].name ?? "")
                      .bodyMedium(color: Constants.black3)),
                  DataCell(
                    CustomTextField(
                      controller: controller.textControllers["${sku}_size"],
                      hintText: "المقاس",
                      onChanged: (value) {
                        controller.products[index].size = value;
                      },
                    ),
                  ),
                  DataCell(
                    CustomTextField(
                      controller: controller.textControllers["${sku}_color"],
                      hintText: "اللون",
                      onChanged: (value) {
                        controller.products[index].color = value;
                      },
                    ),
                  ),
                  DataCell(
                    CustomTextField(
                      controller:
                          controller.textControllers["${sku}_purchasePrice"],
                      hintText: "سعر الشراء",
                      onChanged: (value) {
                        if (value!.isNotEmpty) {
                          controller.products[index].dollarPurchasingPrice =
                              double.parse(value);
                        }
                      },
                    ),
                  ),
                  DataCell(
                    CustomTextField(
                      controller:
                          controller.textControllers["${sku}_sellingPrice"],
                      hintText: "سعر البيع",
                      onChanged: (value) {
                        if (value!.isNotEmpty) {
                          controller.products[index].dinarSellingPrice =
                              double.parse(value);
                        }
                      },
                    ),
                  ),
                  DataCell(
                    CustomTextField(
                      controller: controller.textControllers["${sku}_quantity"],
                      hintText: "الكمية",
                      onChanged: (value) {
                        if (value!.isNotEmpty) {
                          controller.products[index].qty = int.parse(value);
                        }
                      },
                    ),
                  ),
                  DataCell(
                    IconButton(
                      icon: "delete".iconColored(color: Constants.cancel),
                      onPressed: () {
                        controller.removePurchaseProduct(index);
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
