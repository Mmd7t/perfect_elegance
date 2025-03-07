import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';

class CustomSearchDropdown extends StatelessWidget {
  final List<String>? data;
  final String? validator;
  final String? hint;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? selectedItem;
  final bool? showSearchBox;
  final EdgeInsetsGeometry? padding;
  const CustomSearchDropdown({
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
      child: DropdownSearch<String>(
        key: key,
        popupProps: PopupProps.dialog(
          itemBuilder: (context, item, isSelected, b) => ListTile(
            title: item.body(color: Colors.white),
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
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return validator;
          } else {
            return null;
          }
        },
        mode: Mode.form,
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
