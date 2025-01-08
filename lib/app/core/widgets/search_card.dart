import 'package:perfect_elegance/app/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchCard extends StatelessWidget {
  final String text;
  final String icon;
  final String? tag;
  final TextEditingController? controller;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onTap;
  const SearchCard({
    super.key,
    required this.text,
    this.onTap,
    this.tag,
    required this.icon,
    this.controller,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag ?? 'search card',
      child: Material(
        child: CustomTextField(
          controller: controller,
          hintText: text,
          prefixIcon: 'search',
          contentPadding: 12,
          suffixText: "بحث",
          suffixColor: Get.theme.primaryColor,
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (p0) {
            if (onSuffixTap != null) {
              onSuffixTap!();
            }
          },
          inputType: TextInputType.text,
          onSuffixTap: onSuffixTap,
          onTap: onTap,
        ),
      ),
    );
  }
}
