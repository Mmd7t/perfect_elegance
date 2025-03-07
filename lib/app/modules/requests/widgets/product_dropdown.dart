import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/data/models/products_model/product.dart';

class ProductDropdown extends StatelessWidget {
  final List<SalesProduct>? data;
  final String? validator;
  final String? hint;
  final Function(SalesProduct?)? onSaved;
  final Function(SalesProduct?)? onChanged;
  final SalesProduct? selectedItem;
  final bool? showSearchBox;
  final EdgeInsetsGeometry? padding;
  const ProductDropdown({
    super.key,
    this.data,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.hint,
    this.selectedItem,
    this.showSearchBox = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 2),
      child: DropdownSearch<SalesProduct>(
        key: key,
        popupProps: PopupProps.dialog(
          itemBuilder: (context, item, isSelected, b) => ListTile(
            title: "${item.product!.name}".body(color: Colors.white),
            selected: isSelected,
          ),
          dialogProps: DialogProps(
            backgroundColor: Get.theme.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          scrollbarProps: const ScrollbarProps(radius: Radius.circular(20)),
          fit: FlexFit.loose,
          showSelectedItems: true,
          showSearchBox: showSearchBox!,
          listViewProps: const ListViewProps(physics: BouncingScrollPhysics()),
          searchFieldProps: TextFieldProps(
            style: Get.textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: 'أبحث عن',
              hintStyle: Get.textTheme.bodySmall!.copyWith(
                color: Colors.grey.shade400,
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 2, 48, 135),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
        items: (filter, loadProps) => data!,
        selectedItem: selectedItem,
        itemAsString: (item) {
          return "${item.product!.name}";
        },
        validator: (SalesProduct? value) {
          if (value == null) {
            return validator;
          } else {
            return null;
          }
        },
        mode: Mode.form,
        compareFn: (item1, item2) {
          return item1 == item2;
        },
        onSaved: onSaved,
        onChanged: onChanged,
        autoValidateMode: AutovalidateMode.onUserInteraction,
        decoratorProps: DropDownDecoratorProps(
          decoration: CustomInputDecoration.decorate(
            hintText: hint ?? "",
            noBorder: true,
            fillColor: const Color(0xFFF7F8F9),
          ),
        ),
      ),
    );
  }
}
