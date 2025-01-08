import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:perfect_elegance/app/core/widgets/global_appbar.dart';
import 'package:perfect_elegance/app/core/widgets/global_button.dart';
import 'package:perfect_elegance/app/core/widgets/global_textfield.dart';
import 'package:perfect_elegance/app/data/extensions/extensions.dart';
import 'package:perfect_elegance/app/modules/auth/controllers/auth_controller.dart';
import 'package:perfect_elegance/app/routes/app_pages.dart';

class ForgetPassView extends GetView<AuthController> {
  const ForgetPassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppbar(title: "نسيت كلمة المرور؟"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: Get.width,
              child:
                  "أدخل بريدك الإلكتروني وسنرسل لك رابطًا لإعادة\nتعيين كلمة المرور الخاصة بك."
                      .title(),
            ),
            const SizedBox(height: 80),
            const GlobalTextField(
              hintText: "test@example.com",
              title: "البريد الالكتروني",
              inputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const Spacer(),
            GlobalButton(
              onTap: () {
                controller.appServices.isSignup.value = false;
                Get.toNamed(Routes.otpCode);
              },
              text: "استمرار",
              width: Get.width,
              height: 60,
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
