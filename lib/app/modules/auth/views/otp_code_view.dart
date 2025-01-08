import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/data/constants/constants.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/auth/controllers/otp_controller.dart';
import 'package:perfect_elegance/app/modules/auth/widgets/pin_field.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class OtpCodeView extends StatefulWidget {
  const OtpCodeView({super.key});

  @override
  State<OtpCodeView> createState() => _OtpCodeViewState();
}

class _OtpCodeViewState extends State<OtpCodeView> {
  final OtpController controller = Get.find<OtpController>();

  late Timer _timer;
  int _start = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() => timer.cancel());
      } else {
        setState(() => _start--);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "رمز التفعيل"),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    'emailillu.png'.assetImage,
                    const SizedBox(height: 25),
                    SizedBox(
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          'رمز التحقق'.titleSmall(color: Constants.black2),
                          const SizedBox(height: 5),
                          'أدخل رمز التحقق الذي تم أرسالة إلى بريدك الإلكتروني.'
                              .bodyMedium(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Form(key: controller.otpFormKey, child: const PinField()),
                    const SizedBox(height: 30),
                    if (_start == 0) ...{
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          'لم تستلم الرمز؟'.bodyMedium(color: Constants.grey4),
                          const SizedBox(width: 3),
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: 'أعد الإرسال'.bodyMedium(
                                color: Get.theme.primaryColor,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    } else ...{
                      '00:$_start'.bodyMedium(color: Constants.grey4),
                    },
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  GlobalButton(
                    onTap: () {
                      // if (controller.otpFormKey.currentState!.validate()) {
                      //   controller.otpFormKey.currentState!.save();
                      //   controller.verifyOtp();
                      // }
                      if (controller.appServices.isSignup.value) {
                        Get.offNamedUntil(Routes.login, (route) => false);
                      } else {
                        Get.toNamed(Routes.resetPass);
                      }
                    },
                    text: 'تأكيد',
                    width: context.width * 0.95,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
