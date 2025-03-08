import 'package:cached_network_image/cached_network_image.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' hide Svg;
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

extension CustomBoxDecoration on Widget {
  Widget decorate({
    Color? color,
    double? radius,
    double? width,
    double? height,
    double? padding,
    bool shadow = true,
  }) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      padding:
          padding == null ? const EdgeInsets.all(0) : EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        boxShadow: shadow
            ? [
                BoxShadow(
                  color: const Color(0xFF767676).withValues(alpha: 0.1),
                  blurRadius: 7,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: this,
    );
  }

  Widget dialogTransition(Animation<double> animation) {
    Tween<Offset> tween;
    if (animation.status == AnimationStatus.reverse) {
      tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
    } else {
      tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
    }

    return SlideTransition(
      position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOutBack)),
      child: this,
    );
  }

  Widget shimmer({int? duration, Color? highlightColor, Color? baseColor}) =>
      Shimmer.fromColors(
        period: Duration(milliseconds: duration ?? 1500),
        highlightColor: highlightColor ?? Colors.grey[50]!,
        baseColor: baseColor ?? Colors.grey[200]!,
        direction: ShimmerDirection.rtl,
        child: this,
      );
}

extension CustomInputDecoration on InputDecoration {
  static InputDecoration decorate({
    required String hintText,
    String? prefixIcon,
    String? suffixIcon,
    String? suffixText,
    Color? fillColor,
    bool? noBorder,
    Color? suffixColor,
    VoidCallback? onSuffixTap,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        fontSize: 13,
        color: Constants.grey4,
        fontFamily: 'Cairo',
      ),
      errorStyle: const TextStyle(
        fontSize: 12,
        color: Constants.cancel,
        fontFamily: 'Cairo',
      ),
      filled: true,
      fillColor: fillColor,
      prefixIcon: prefixIcon != null
          ? UnconstrainedBox(
              child: prefixIcon.iconColored(color: Constants.grey4))
          : const SizedBox(),
      prefixIconConstraints: prefixIcon != null
          ? const BoxConstraints.expand(width: 50, height: 50)
          : const BoxConstraints.expand(width: 20, height: 20),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
      enabledBorder: OutlineInputBorder(
        borderSide: noBorder! || fillColor != null
            ? BorderSide.none
            : const BorderSide(color: Constants.grey3, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      border: OutlineInputBorder(
        borderSide: noBorder
            ? BorderSide.none
            : const BorderSide(color: Constants.grey3, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: noBorder
            ? BorderSide.none
            : const BorderSide(color: Constants.primary, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: noBorder
            ? BorderSide.none
            : const BorderSide(color: Constants.secondary, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      suffixIcon: (suffixIcon == null)
          ? null
          : IconButton(
              onPressed: onSuffixTap,
              icon:
                  suffixIcon.iconColored(color: Constants.secondary, size: 24),
            ),
    );
  }

  static InputDecoration decorate2(
      {required String hintText,
      String? prefixIcon,
      String? suffixIcon,
      String? suffixText,
      double? borderRadius,
      Color? suffixColor,
      VoidCallback? onSuffixTap}) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: const Color(0xFFF9FAFB),
      hintStyle: const TextStyle(
        fontSize: 13,
        color: Constants.grey4,
        fontFamily: 'Cairo',
      ),
      prefixIcon: prefixIcon != null
          ? UnconstrainedBox(
              child: prefixIcon.iconColored(color: Constants.primary, size: 20))
          : const SizedBox(),
      prefixIconConstraints: prefixIcon != null
          ? const BoxConstraints.expand(width: 50, height: 40)
          : const BoxConstraints.expand(width: 20, height: 20),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Constants.grey5, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 12)),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Constants.grey5, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 12)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Constants.primary, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 12)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Constants.cancel, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 12)),
      ),
      suffixIcon: (suffixIcon == null)
          ? null
          : IconButton(
              onPressed: onSuffixTap,
              icon:
                  suffixIcon.iconColored(color: Constants.secondary, size: 20),
            ),
    );
  }
}

extension CustomIconProvider on String {
  Widget iconColored({double? size, Color? color}) => SvgPicture.asset(
        'assets/icons/$this.svg',
        width: size ?? 24,
        height: size ?? 24,
        colorFilter: color == null
            ? const ColorFilter.mode(Colors.white, BlendMode.dst)
            : ColorFilter.mode(color, BlendMode.srcATop),
      );
}

extension CustomTextStyles on String {
  Text get displayMedium => Text(
        this,
        style: Get.textTheme.displayMedium!.merge(
          TextStyle(
            color: Get.theme.primaryColor,
            fontFamily: 'Cairo',
          ),
        ),
        softWrap: true,
        textAlign: TextAlign.center,
      );

  Text displaySmall({Color? color}) => Text(
        this,
        style: Get.textTheme.displaySmall!.merge(
          TextStyle(
            color: color ?? Get.theme.primaryColor,
            fontFamily: 'Cairo',
          ),
        ),
      );

  Text headline({Color? color}) => Text(
        this,
        style: Get.textTheme.headlineMedium!.merge(
          TextStyle(
            fontWeight: FontWeight.bold,
            color: color ?? Get.theme.primaryColor,
            fontFamily: 'Cairo',
            fontSize: Get.textTheme.headlineMedium!.fontSize! - 2,
          ),
        ),
      );

  Text title({Color? color, FontWeight? weight}) => Text(
        this,
        style: Get.textTheme.titleLarge!.merge(
          TextStyle(
            color: color ?? Get.theme.colorScheme.secondary,
            fontWeight: weight ?? FontWeight.bold,
            fontSize: Get.size.shortestSide < 600
                ? Get.textTheme.titleLarge!.fontSize! - 4
                : Get.textTheme.titleLarge!.fontSize! - 2,
            fontFamily: 'Cairo',
          ),
        ),
      );
  Text titleSmall({Color? color, FontWeight? weight}) => Text(
        this,
        style: Get.textTheme.titleMedium!.merge(
          TextStyle(
            color: color ?? Get.theme.colorScheme.secondary,
            fontWeight: weight ?? FontWeight.bold,
            fontSize: Get.size.shortestSide < 600
                ? Get.textTheme.titleMedium!.fontSize! - 2
                : Get.textTheme.titleMedium!.fontSize!,
            fontFamily: 'Cairo',
          ),
        ),
      );

  Text subtitle({Color? color, FontWeight? weight}) => Text(
        this,
        style: Get.textTheme.titleSmall!.merge(
          TextStyle(
            color: color ?? Colors.black,
            fontFamily: 'Cairo',
            fontWeight: weight ?? FontWeight.w600,
            fontSize: Get.size.shortestSide < 600
                ? Get.textTheme.titleSmall!.fontSize!
                : Get.textTheme.titleSmall!.fontSize! + 2,
          ),
        ),
      );

  Text body(
          {Color? color,
          bool center = false,
          FontWeight weight = FontWeight.normal}) =>
      Text(
        this,
        style: Get.textTheme.bodyLarge!.merge(
          TextStyle(
            color: color ?? Constants.grey3,
            fontFamily: 'Cairo',
            height: 1.5,
            fontSize: Get.size.shortestSide < 600
                ? Get.textTheme.bodyLarge!.fontSize!
                : Get.textTheme.bodyLarge!.fontSize! + 2,
            fontWeight: weight,
          ),
        ),
        softWrap: true,
        textAlign: center ? TextAlign.center : TextAlign.start,
      );
  Text bodyMedium({
    Color? color,
    bool center = false,
    FontWeight weight = FontWeight.normal,
    int? maxLines,
    TextOverflow? overflow,
  }) =>
      Text(
        this,
        style: Get.textTheme.bodyMedium!.merge(
          TextStyle(
            color: color ?? Constants.grey3,
            overflow: overflow,
            fontFamily: 'Cairo',
            fontSize: Get.size.shortestSide < 600
                ? Get.textTheme.bodyMedium!.fontSize!
                : Get.textTheme.bodyMedium!.fontSize! + 2,
            height: 1.5,
            fontWeight: weight,
          ),
        ),
        maxLines: maxLines,
        softWrap: true,
        textAlign: center ? TextAlign.center : TextAlign.start,
      );

  Text caption({Color? color, FontWeight? weight}) => Text(
        this,
        style: Get.textTheme.bodySmall!.merge(
          TextStyle(
            color: color ?? Constants.grey3,
            fontFamily: 'Cairo',
            fontWeight: weight ?? FontWeight.normal,
          ),
        ),
      );

  Text overline({Color? color, FontWeight? weight}) => Text(
        this,
        style: Get.textTheme.labelSmall!.merge(
          TextStyle(
            color: color ?? Constants.grey3,
            fontFamily: 'Cairo',
            fontWeight: weight ?? FontWeight.normal,
          ),
        ),
      );

  Text labelMedium({Color? color, FontWeight? weight}) => Text(
        this,
        style: Get.textTheme.labelMedium!.merge(
          TextStyle(
            color: color ?? Constants.grey3,
            fontFamily: 'Cairo',
            fontWeight: weight ?? FontWeight.normal,
          ),
        ),
      );

  Text button({Color? color, TextDecoration? decor}) => Text(
        this,
        style: Get.textTheme.labelLarge!.merge(
          TextStyle(
            color: color ?? Get.theme.primaryColor,
            fontWeight: FontWeight.bold,
            decoration: decor,
            fontFamily: 'Cairo',
          ),
        ),
      );
}

extension CustomImage on String {
  Widget image({BoxFit? fit = BoxFit.cover}) => CachedNetworkImage(
        imageUrl: this,
        alignment: Alignment.center,
        fit: fit,
        placeholder: (context, s) => Lottie.asset(
          'assets/lotties/image-loader.json',
          alignment: Alignment.center,
        ),
        errorWidget: (context, s, v) => Image.asset('assets/images/logo.png'),
      );
  Widget get profileImage => CachedNetworkImage(
        imageUrl: this,
        alignment: Alignment.center,
        fit: BoxFit.cover,
        placeholder: (context, s) => Lottie.asset(
          'assets/lotties/image-loader.json',
          alignment: Alignment.center,
        ),
        errorWidget: (context, s, v) =>
            Image.asset('assets/images/profile.png'),
      );
  Widget get assetImage => Image.asset(
        'assets/images/$this',
        alignment: Alignment.center,
        fit: BoxFit.cover,
      );
}

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null) {
      return renderObject!.paintBounds
          .shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }

  Offset get offset {
    RenderBox renderObject = currentContext?.findRenderObject() as RenderBox;
    return renderObject.localToGlobal(Offset.zero);
  }
}
