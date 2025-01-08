import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalButton extends StatelessWidget {
  final double? width, height;
  final String? icon;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? radius;
  final VoidCallback onTap;
  const GlobalButton({
    super.key,
    required this.onTap,
    this.icon,
    required this.text,
    this.color,
    this.textColor,
    this.height,
    this.width,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        color: color ?? Get.theme.primaryColor,
      ),
      child: MaterialButton(
        minWidth: width,
        height: height ?? 55,
        onPressed: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10)),
        child: (icon != null)
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon!.iconColored(color: textColor ?? Colors.white),
                  const SizedBox(width: 8),
                  text.subtitle(color: textColor ?? Colors.white),
                ],
              )
            : text.subtitle(
                color: textColor ?? Colors.white,
                weight: FontWeight.w700,
              ),
      ),
    );
  }
}
