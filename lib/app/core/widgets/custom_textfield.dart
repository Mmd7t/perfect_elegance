import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
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
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final Color? suffixColor;
  final int maxLines;
  final double? contentPadding;
  final VoidCallback? onTap;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixText,
    this.contentPadding,
    this.onSuffixTap,
    this.onTap,
    this.onChanged,
    this.textInputFormatters,
    this.onFieldSubmitted,
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
      child: TextFormField(
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
        onFieldSubmitted: onFieldSubmitted,
        decoration: CustomInputDecoration.decorate2(
          hintText: hintText,
          prefixIcon: prefixIcon,
          onSuffixTap: onSuffixTap,
          suffixIcon: suffixIcon,
          suffixText: suffixText,
          suffixColor: suffixColor,
        ),
      ),
    );
  }
}
