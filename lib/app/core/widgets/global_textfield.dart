import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalTextField extends StatelessWidget {
  final String hintText;
  final String title;
  final String? prefixIcon;
  final String? suffixIcon;
  final String? suffixText;
  final VoidCallback? onSuffixTap;
  final bool obsecure;
  final TextInputType inputType;
  final List<TextInputFormatter>? textInputFormatters;
  final TextInputAction textInputAction;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color? suffixColor;
  final int maxLines;
  final double? contentPadding;
  final bool noBorder;
  final bool filled;
  final VoidCallback? onTap;
  const GlobalTextField({
    super.key,
    required this.hintText,
    required this.title,
    this.prefixIcon,
    this.suffixText,
    this.contentPadding,
    this.noBorder = false,
    this.onSuffixTap,
    this.onTap,
    this.onChanged,
    this.filled = false,
    this.textInputFormatters,
    this.suffixIcon,
    this.maxLines = 1,
    this.obsecure = false,
    this.inputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onSaved,
    this.validator,
    this.controller,
    this.suffixColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.titleSmall(
              color: Constants.secondary, weight: FontWeight.normal),
          const SizedBox(height: 8),
          TextFormField(
            onTap: onTap,
            readOnly: onTap != null,
            inputFormatters: textInputFormatters,
            controller: controller,
            obscureText: obsecure,
            keyboardType: inputType,
            textInputAction: textInputAction,
            onSaved: onSaved,
            validator: validator,
            onChanged: onChanged,
            maxLines: maxLines,
            decoration: CustomInputDecoration.decorate(
              hintText: hintText,
              prefixIcon: prefixIcon,
              onSuffixTap: onSuffixTap,
              fillColor: filled ? const Color(0xFFF7F8F9) : null,
              noBorder: noBorder,
              suffixIcon: suffixIcon,
              suffixText: suffixText,
              suffixColor: suffixColor,
            ),
          ),
        ],
      ),
    );
  }
}
