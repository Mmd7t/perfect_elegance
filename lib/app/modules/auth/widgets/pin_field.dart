import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_elegance/app/modules/auth/controllers/otp_controller.dart';
import 'package:pinput/pinput.dart';

class PinField extends GetWidget<OtpController> {
  const PinField({super.key});

  static const double size = 70.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          onCompleted: (value) {
            controller.otpCode.value = value;
          },
          onSubmitted: (value) {},
          length: 4,
          submittedPinTheme: PinTheme(
            height: size,
            width: size,
            textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Get.theme.primaryColor,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                ),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF1F1).withValues(alpha: 0.2),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color: const Color(0xFFFF0000).withValues(alpha: 0.05),
                width: 2,
              ),
            ),
          ),
          errorPinTheme: PinTheme(
            height: size,
            width: size,
            textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Get.theme.colorScheme.error,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: const Color(0xFFB5B5B5), width: 2),
            ),
          ),
          defaultPinTheme: PinTheme(
            height: size,
            width: size,
            textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold),
            decoration: BoxDecoration(
              color: const Color(0xFFDCDCDC).withValues(alpha: 0.2),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }
}
